<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Route;
use App\Models\Routezone;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

use function PHPSTORM_META\type;

class RouteController extends Controller
{
    public function index(Request $request)
    {
        $routes = Route::all();
        if ($request->ajax()) {

            return DataTables::of($routes)
                ->addColumn('status', function ($route) {
                    return $route->status == 1 ? 'Activo' : 'No Activo';
                })
                ->addColumn('actions', function ($route) {
                    return '
                        <div class="dropdown">
                            <button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bars"></i>                        
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <button class="dropdown-item btnEditar" id="' . $route->id . '"><i class="fas fa-edit"></i>  Editar</button>
                                <form action="' . route('admin.routes.destroy', $route->id) . '" method="POST" class="frmEliminar d-inline">
                                    ' . csrf_field() . method_field('DELETE') . '
                                    <button type="submit" class="dropdown-item"><i class="fas fa-trash"></i> Eliminar</button>
                                </form>
                                <a href="' . route('admin.vehicleroutes.index') . '?route_id=' . $route->id . '" class="dropdown-item">
                                    <i class="fas fa-car"></i> Ver Vehículos
                                </a>
                            </div>
                        </div>';
                })
                ->addColumn('coords', function ($route) {
                    return '<a href="' . route('admin.routes.show', $route->id) . '" class="btn btn-success btn-sm"><i class="fas fa-plus-circle"></i></a>
                    <button class="btn btn-danger btn-sm btnMap" id='.$route->id.'><i class="fas fa-map-marked-alt"></i></button>';
                })
                ->rawColumns(['actions', 'coords'])
                ->make(true);
        } else {
            return view('admin.routes.index');
        }
    }

    public function create()
    {
        return view('admin.routes.create');
    }

    public function store(Request $request)
    {
        try {
            $request->validate([
                "name" => "unique:zones",
            ],[      
                "name.unique" => "El nombre ya ha sido registrado.",
            ]);

            $route = new Route();
            $route->name = $request->name;
            $route->latitud_start = 0;
            $route->latitude_end = 0;
            $route->longitude_start = 0;
            $route->longitude_end = 0;
            $route->status = $request->status;
            $route->save();

            return response()->json(['message' => 'Ruta registrada'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error en la actualización: ' . $th->getMessage()], 500);
        }
    }

    public function edit(string $id)
    {
        $route = Route::find($id);
        return view('admin.routes.edit', compact('route'));
    }

    public function update(Request $request, string $id)
    {
        try {
            $request->validate([
                "name" => "unique:routes,name," . $id,
            ],[      
                "name.unique" => "El nombre ya ha sido registrado.",
            ]);
            
            $route = Route::find($id);
            $route->update($request->all());
            return response()->json(['message' => 'Ruta actualizada correctamente'], 200);
        } catch (\Throwable $th) {

            return response()->json(['message' => 'Error en la actualización: ' . $th->getMessage()], 500);
        }
    }

    public function destroy(string $id)
    {
        try {
            $route = Route::find($id);
            $route->delete();
            return response()->json(['message' => 'Ruta eliminada correctamente'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error al eliminar la ruta, porque tiene coordenadas asignadas.'], 500);
        }
    }

    public function show(Request $request, string $id)
    {
        $route = Route::find($id);        

        if ($request->ajax()) {
            if ($request->get('type') === 'coords') {

                $coords = collect([
                    [
                        'type' => 'Inicio',
                        'latitude' => $route->latitud_start,
                        'longitude' => $route->longitude_start,
                    ],
                    [
                        'type' => 'Fin',
                        'latitude' => $route->latitude_end,
                        'longitude' => $route->longitude_end,
                    ],
                ])->filter(function ($coord) {
                    return $coord['latitude'] != 0 && $coord['longitude'] != 0;
                });

                return DataTables::of($coords)->make(true);

            } elseif ($request->get('type') === 'zones') {

                $routezones = DB::select('CALL sp_routezones(2,' . $id . ')');
                
                return DataTables::of($routezones)
                    ->addColumn('delete', function ($routezone) {
                        return '<form action="' . route('admin.routezones.destroy', $routezone->routezone_id) . '" method="POST" class="frmEliminar d-inline">
                                        ' . csrf_field() . method_field('DELETE') . '
                                        <button type="submit" class="btn btn-danger btn-sm btnDelete"><i class="fas fa-trash"></i></button>
                                    </form>';
                    })
                    ->rawColumns(['delete'])
                    ->make(true);
            }
        } else {
            return view('admin.routes.show', compact('route'));
        }
    }

    public function showEditCoordinatesForm(string $route_id, string $type)
    {
        $route = Route::find($route_id);
        $latitude = 0;
        $longitude = 0;
        if ($type === 'start_coord') {
            $latitude = $route->latitude_end;
            $longitude = $route->longitude_end;
        } elseif ($type === 'end_coord') {
            $latitude = $route->latitud_start;
            $longitude = $route->longitude_start;
        }
        return view('admin.routes.editcoords', compact('latitude', 'longitude', 'type', 'route_id'));
    }

    public function updateRouteStartAndEndCoords(Request $request)
    {
        try {
            $route = Route::find($request->route_id);

            if ($request->type === 'start_coord') {
                $route->latitud_start = $request->latitude;
                $route->longitude_start = $request->longitude;
            } elseif ($request->type === 'end_coord') {
                $route->latitude_end = $request->latitude;
                $route->longitude_end = $request->longitude;
            }

            $route->save();

            return response()->json(['message' => 'Coordenada registrada correctamente'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error al registrar la coordenada: ' . $th->getMessage()], 500);
        }
    }

    public function showRouteMap(string $route_id)
    {
        $routecoords = DB::table('routes')
            ->select('latitud_start', 'longitude_start', 'latitude_end', 'longitude_end')
            ->where('id', $route_id)
            ->first();

        $zoneIds = DB::table('routezones as rz')
            ->where('rz.route_id', $route_id)
            ->pluck('rz.zone_id');
        
        $zone_coords = DB::table('zonecoords as zc')
            ->join('zones as z', 'zc.zone_id', '=', 'z.id')
            ->whereIn('zc.zone_id', $zoneIds)
            ->select('zc.latitude as lat', 'zc.longitude as lng', 'zc.zone_id', 'z.name as zone_name')
            ->get();

        return view('admin.routes.showmap', compact('routecoords', 'zone_coords'));
    }
}
