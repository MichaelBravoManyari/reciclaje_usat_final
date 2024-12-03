<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Programming;
use App\Models\Route;
use App\Models\Routestatu;
use App\Models\Schedules;
use App\Models\Vehicle;
use App\Models\Vehicleroute;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class ProgrammingmassiveController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $programmings = DB::select('CALL sp_programming()');

        $programmings = collect($programmings)->map(function ($programming) {
            $programming->time_route = Carbon::parse($programming->time_route)->format('H:i');
            $programming->startdate = Carbon::parse($programming->startdate)->format('d/m/Y');
            $programming->lastdate = Carbon::parse($programming->lastdate)->format('d/m/Y');
            return $programming;
        });

        if ($request->ajax()) {
            return DataTables::of($programmings)
                ->addColumn('actions', function ($programming) {
                    if ($programming->status == 'Finalizado') {
                        return '';
                    }
                    return '
                    <div class="dropdown">
                        <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-bars"></i>                        
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <button class="dropdown-item btnEditar" id="' . $programming->id . '">
                                <i class="fas fa-edit"></i> Editar
                            </button>
                            <button class="dropdown-item btnShow" id="' . $programming->id . '"><i class="fas fa-eye"></i> Ver Programación</button>
                        </div>
                    </div>';
                })
                ->rawColumns(['actions'])  // Declarar columnas que contienen HTML
                ->make(true);
        } else {
            return view('admin.programmingmassive.index', compact('programmings'));
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, string $id)
    {
        $programming = Programming::find($id);

        $programming->startdate = Carbon::parse($programming->startdate)->format('d/m/Y');
        $programming->lastdate = Carbon::parse($programming->lastdate)->format('d/m/Y');

        $results = DB::table('programmings as p')
            ->join('vehicleroutes as v', 'p.id', '=', 'v.programming_id')
            ->where('p.id', $id)
            ->get();

        $route_id = $results->first()->route_id; // Obtiene el primer resultado de la colección

        $programmingdays = DB::select('CALL sp_programmingday(' . $id . ')');

        if ($request->ajax()) {
            return DataTables::of($programmingdays)
                ->addColumn('actions', function ($programmingday) {
                    return '
                        <div class="dropdown">
                            <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bars"></i>                        
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <button class="dropdown-item btnRouteMap" id="' . $programmingday->id . '"><i class="fas fa-route"></i> Ver Recorrido</button>
                            </div>
                        </div>';
                })
                ->rawColumns(['actions'])  // Declarar columnas que contienen HTML
                ->make(true);
        } else {
            return view('admin.programmingmassive.show', compact('programming', 'programmingdays', 'route_id'));
        }
    }

    /**
     * Show the form for editing the specified resource.
     */

    public function Edit(Request $request, string $id)
    {
        $programming = Programming::find($id);

        $vehicles = Vehicle::pluck('name', 'id');
        $routes = Route::pluck('name', 'id');
        $routestatus = Routestatu::pluck('name', 'id');
        $schedule = Schedules::pluck('name', 'id');

        $vehicleroute = $programming->vehicleroutes()->first();

        // Si existe relación, se obtiene los valores
        $vehicle_id = $vehicleroute ? $vehicleroute->vehicle_id : null;
        $route_id = $vehicleroute ? $vehicleroute->route_id : null;
        $routestatus_id = $vehicleroute ? $vehicleroute->routestatus_id : null;
        $schedule_id = $vehicleroute ? $vehicleroute->schedule_id : null;
        $time_route = $vehicleroute ? $vehicleroute->time_route : null;

        return view('admin.programmingmassive.edit', compact(
            'programming',
            'vehicles',
            'routes',
            'routestatus',
            'schedule',
            'vehicle_id',
            'route_id',
            'routestatus_id',
            'schedule_id',
            'time_route'
        ));
    }


    /**
     * Update the specified resource in storage.
     */

    public function update(Request $request, string $id)
    {
        try {
            $programming = Vehicleroute::where('programming_id', $id)->get();

            $programmingDetails = Programming::where('id', $id)->first();
            $startdate = $programmingDetails->startdate;
            $lastdate = $programmingDetails->lastdate;

            $newRoutestatusId = $request->routestatus_id;
            $newTimeRoute = $request->time_route;
            $newScheduleId = $request->schedule_id;
            $newVehicleId = $request->vehicle_id;
            $newDescription = $request->description;

            $existingProgrammes = Vehicleroute::where('vehicle_id', $newVehicleId)
                ->where('route_id', $newRoutestatusId)
                ->whereBetween('date_route', [$startdate, $lastdate])
                ->get();

            $formattedStartDate = Carbon::parse($startdate)->format('d/m/Y');
            $formattedLastDate = Carbon::parse($lastdate)->format('d/m/Y');

            if ($existingProgrammes->count() > 0) {
                return response()->json(['message' => 'Ya existe una programación para este vehículo y ruta en las fechas: ' . $formattedStartDate . ' hasta ' . $formattedLastDate . ''], 400);
            } else {
                foreach ($programming as $route) {
                    $route->routestatus_id = $newRoutestatusId;
                    $route->time_route = $newTimeRoute;
                    $route->schedule_id = $newScheduleId;
                    $route->vehicle_id = $newVehicleId;
                    $route->description = $newDescription;
                    $route->save();
                }

                return response()->json(['message' => 'Programación actualizada masivamente exitosamente'], 200);
            }
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error: ' . $th->getMessage()], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    /* public function update(Request $request, string $id)
    {
        try {
            $programming = Vehicleroute::where('programming_id', $id)->get();

            $newRoutestatusId = $request->routestatus_id;
            $newTimeRoute = $request->time_route;
            $newScheduleId = $request->schedule_id;
            $newVehicleId = $request->vehicle_id;
            $newDescription = $request->description;

            foreach ($programming as $route) {
                $route->routestatus_id = $newRoutestatusId; // Asigna el nuevo valor para `routestatus_id`
                $route->time_route = $newTimeRoute; // Asigna el nuevo valor para `time_route`
                $route->schedule_id = $newScheduleId; // Asigna el nuevo valor para `schedule_id`
                $route->vehicle_id = $newVehicleId; // Asigna el nuevo valor para `vehicle_id`
                $route->description = $newDescription; // Asigna el nuevo valor para `description`
                $route->save(); // Guarda el registro actualizado en la base de datos
            }

            return response()->json(['message' => 'Programación actualizada masivamente exitosamente'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error: ' . $th->getMessage()], 500);
        }   
    } */
}
