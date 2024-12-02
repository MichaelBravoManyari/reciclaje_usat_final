<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Routepath;
use App\Models\Vehicleroute;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RoutepathController extends Controller
{
    public function edit(string $id)
    {
        $vehicleroute = Vehicleroute::find($id);
        $vehicleroute_id = $vehicleroute->id;

        $routecoords = DB::table('routes')
            ->select('latitud_start', 'longitude_start', 'latitude_end', 'longitude_end')
            ->where('id', $vehicleroute->route_id)
            ->first();
        
        $zoneIds = DB::table('routezones as rz')
            ->where('rz.route_id', $vehicleroute->route_id)
            ->pluck('rz.zone_id');
        
        $zone_coords = DB::table('zonecoords as zc')
            ->join('zones as z', 'zc.zone_id', '=', 'z.id')
            ->whereIn('zc.zone_id', $zoneIds)
            ->select('zc.latitude as lat', 'zc.longitude as lng', 'zc.zone_id', 'z.name as zone_name')
            ->get();

        $last_coords_route_path = Routepath::select(
                'latitude as lat',
                'longitude as lng'
            )->where('vehicleroute_id', $vehicleroute_id)->latest()->first();

        $route_paths = DB::table('routepaths')
            ->select('latitude as lat', 'longitude as lng')
            ->where('vehicleroute_id', $vehicleroute_id)
            ->orderBy('created_at')
            ->get();

        return view('admin.routepaths.create', compact('vehicleroute_id', 'routecoords', 'zone_coords', 'last_coords_route_path', 'route_paths'));
    }

    public function store(Request $request)
    {
        try {
            Routepath::create($request->all());
            return response()->json(['message' => 'Coordenada registrada'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error en el registro: ' . $th->getMessage()], 500);
        }
    }

    public function destroy(string $id)
    {
        try {
            $routepath = Routepath::find($id);
            $routepath->delete();
            return response()->json(['message' => 'Coordenada eliminada correctamente'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error al eliminar la coordenada.'], 500);
        }
    }

    public function show(string $id)
    {
        $vehicleroute = Vehicleroute::find($id);
        $vehicleroute_id = $vehicleroute->id;

        $routecoords = DB::table('routes')
            ->select('latitud_start', 'longitude_start', 'latitude_end', 'longitude_end')
            ->where('id', $vehicleroute->route_id)
            ->first();

        $zoneIds = DB::table('routezones as rz')
            ->where('rz.route_id', $vehicleroute->route_id)
            ->pluck('rz.zone_id');
        
        $zone_coords = DB::table('zonecoords as zc')
            ->join('zones as z', 'zc.zone_id', '=', 'z.id')
            ->whereIn('zc.zone_id', $zoneIds)
            ->select('zc.latitude as lat', 'zc.longitude as lng', 'zc.zone_id', 'z.name as zone_name')
            ->get();

        $route_paths = DB::table('routepaths')
            ->select('latitude as lat', 'longitude as lng')
            ->where('vehicleroute_id', $vehicleroute_id)
            ->orderBy('created_at')
            ->get();

        return view('admin.routepaths.show', compact('routecoords', 'zone_coords', 'route_paths'));
    }
}
