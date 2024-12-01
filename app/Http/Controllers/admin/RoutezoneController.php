<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Routezone;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RoutezoneController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        $route_id = $request->input('route_id');

        $results = DB::select('CALL sp_routezones(1, ?)', [$route_id]);

        $zones = collect($results)->pluck('name', 'id')->toArray();

        return view('admin.routezones.create', compact('zones', 'route_id'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {

            Routezone::create($request->all());

            return response()->json(['message' => 'Zona añadida a la ruta correctamente'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error al añadir la zona a la ruta: ' . $th->getMessage()], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $routezone = Routezone::find($id);
            $routezone->delete();
            return response()->json(['message' => 'Zona eliminada de la ruta'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error al eliminar la zona de la ruta'], 500);
        }
    }
}
