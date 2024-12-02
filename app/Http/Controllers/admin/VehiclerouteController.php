<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Route;
use App\Models\Routepath;
use App\Models\Schedules;
use App\Models\Vehicle;
use App\Models\Vehicleroute;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class VehiclerouteController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $route_id = $request->get('route_id');

            $vehicleroutes = DB::table('vehicleroutes as v')
                ->join('vehicles as v2', 'v.vehicle_id', '=', 'v2.id')
                ->join('schedules as s', 'v.schedule_id', '=', 's.id')
                ->where('v.route_id', $route_id)
                ->select('v.id as vehicleroute_id', 'v2.name as vehicle_name', 'v.date_route', 'v.time_route', 's.name as schedule_name', 'v.description')
                ->get();
                
            return DataTables::of($vehicleroutes)
                ->addColumn('actions', function ($vehicleroute) {
                    return '
                        <div class="dropdown">
                            <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bars"></i>                        
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <button class="dropdown-item btnEditar" id="' . $vehicleroute->vehicleroute_id . '"><i class="fas fa-edit"></i>  Editar</button>
                                <form action="' . route('admin.vehicleroutes.destroy', $vehicleroute->vehicleroute_id) . '" method="POST" class="frmEliminar d-inline">
                                    ' . csrf_field() . method_field('DELETE') . '
                                    <button type="submit" class="dropdown-item"><i class="fas fa-trash"></i> Eliminar</button>
                                </form>
                            </div>
                        </div>';
                })
                ->addColumn('coords', function ($vehicleroute) {
                    return '<a href="' . route('admin.vehicleroutes.show', $vehicleroute->vehicleroute_id) . '" class="btn btn-success btn-sm"><i class="fas fa-plus-circle"></i></a>
                    <button class="btn btn-danger btn-sm btnMap" id='.$vehicleroute->vehicleroute_id.'><i class="fas fa-map-marked-alt"></i></button>';
                })
                ->rawColumns(['actions', 'coords'])
                ->make(true);
        } else {
            $route_id = $request->query('route_id');
            $route = Route::find($route_id);

            return view('admin.vehicleroutes.index', compact('route'));
        }
    }

    public function create(Request $request)
    {
        $vehicles = Vehicle::all()->pluck('name', 'id');
        $route_id = $request->get('route_id');
        $schedules = Schedules::all()->pluck('name', 'id');

        return view('admin.vehicleroutes.create', compact('vehicles', 'route_id', 'schedules'));
    }

    public function store(Request $request)
    {
        try {
            Vehicleroute::create($request->all());
            return response()->json(['message' => 'Vehiculo registrado en la ruta'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error en el registro: ' . $th->getMessage()], 500);
        }
    }

    public function edit(string $id)
    {
        $vehicleroute = Vehicleroute::find($id);
        $route_id = $vehicleroute->route_id;
        $vehicles = Vehicle::pluck('name', 'id');
        $schedules = Schedules::pluck('name', 'id');
        return view('admin.vehicleroutes.edit', compact('vehicleroute', 'vehicles', 'schedules', 'route_id'));
    }

    public function update(Request $request, string $id)
    {
        try { 
            $vehicleroute = Vehicleroute::find($id);
            $vehicleroute->update($request->all());
            return response()->json(['message' => 'Ruta del vehiculo actualizada correctamente'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error en la actualización: ' . $th->getMessage()], 500);
        }
    }

    public function destroy(string $id)
    {
        try {
            $vehicleroute = Vehicleroute::find($id);
            $vehicleroute->delete();
            return response()->json(['message' => 'Ruta del vehiculo eliminada correctamente'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error al eliminar la ruta del vehiculo.'], 500);
        }
    }

    public function show(Request $request, string $id)
    {
        if ($request->ajax()) {
            $route_paths_coords = Routepath::where('vehicleroute_id', $id)->get();

            return DataTables::of($route_paths_coords)
                ->addColumn('actions', function ($route_paths_coord) {
                    return '      
                    <form action="' . route('admin.routepaths.destroy', $route_paths_coord->id) . '" method="POST" class="frmEliminar d-inline">
                        ' . csrf_field() . method_field('DELETE') . '
                        <button type="submit" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i></button>
                    </form>';
                })
                ->rawColumns(['actions'])
                ->make(true);
        } else {
            $vehicleroute = DB::table('vehicleroutes as v')
                ->join('vehicles as v2', 'v.vehicle_id', '=', 'v2.id')
                ->join('schedules as s', 'v.schedule_id', '=', 's.id')
                ->where('v.id', $id)
                ->select('v.id as vehicleroute_id', 'v2.name as vehicle_name', 'v.date_route', 'v.time_route', 's.name as schedule_name', 'v.description', 'v.route_id')
                ->get()[0];

            $zone_names = DB::table('routezones as r')
                ->join('zones as z', 'r.zone_id', '=', 'z.id')
                ->select('z.name as zone_name')
                ->where('r.route_id', $vehicleroute->route_id)
                ->get();

            return view('admin.vehicleroutes.show', compact('vehicleroute', 'zone_names'));
        }
    }
}
