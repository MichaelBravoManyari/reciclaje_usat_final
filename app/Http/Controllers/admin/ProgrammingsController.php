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
use DateInterval;
use DatePeriod;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use function Laravel\Prompts\select;

class ProgrammingsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $vehicles = Vehicle::pluck('name', 'id');
        $routes = Route::pluck('name', 'id');
        $schedules = Schedules::pluck('name', 'id');

        $startdate = '';
        $lastdate = '';
        $time_route = '';

        $programmings = [];

        return view('admin.programming.index', compact('programmings', 'vehicles', 'routes', 'schedules', 'startdate', 'lastdate', 'time_route'));
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
    /* public function store(Request $request)
    {
        $request->validate(
            [
                'startdate' => 'required|date',
                'lastdate' => 'required|date|after_or_equal:startdate',
                'time_route' => 'required|date_format:H:i',
            ],
            [
                'startdate.required' => 'La fecha de inicio es obligatoria.',
                'lastdate.required' => 'La fecha de fin es obligatoria.',
                'lastdate.after_or_equal' => 'La fecha de fin debe ser igual o posterior a la fecha de inicio.',
            ]
        );

        try {
            $programming = [
                'startdate' => $request->startdate,
                'lastdate' => $request->lastdate,
                'vehicle_id' => $request->vehicle_id,
                'route_id' => $request->route_id,
                'schedule_id' => $request->schedule_id
            ];
            if ($this->searchifexist($programming) == 0) {
                $programming = Programming::create([
                    'startdate' => $request->startdate,
                    'lastdate' => $request->lastdate,
                ]);

                $begin = new DateTime($request->startdate);
                $last = date($request->lastdate);
                $end = date("d-m-Y", strtotime($last . '+ 1 days'));
                $interval = DateInterval::createFromDateString('1 day');
                $period = new DatePeriod($begin, $interval, new DateTime($end));

                foreach ($period as $p) {
                    Vehicleroute::create([
                        'date_route' => $p->format("Y-m-d"),
                        'time_route' => $request->time_route,
                        'description' => '',
                        'vehicle_id' => $request->vehicle_id,
                        'route_id' => $request->route_id,
                        'routestatus_id' => 1,
                        'programming_id' => $programming->id,
                        'schedule_id' => $request->schedule_id
                    ]);
                }

                return response()->json(['message' => 'Programación registrada exitosamente'], 200);
            } else {
                return response()->json(['message' => 'Ya existe una programación del vehículo y ruta en los días seleccionados'], 400);
            }
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error: ' . $th->getMessage()], 500);
        }
    } */

    /* public function store(Request $request)
    {
        $request->validate(
            [
                'startdate' => 'required|date',
                'lastdate' => 'required|date|after_or_equal:startdate',
                'time_route' => 'required|date_format:H:i',
            ],
            [
                'startdate.required' => 'La fecha de inicio es obligatoria.',
                'lastdate.required' => 'La fecha de fin es obligatoria.',
                'lastdate.after_or_equal' => 'La fecha de fin debe ser igual o posterior a la fecha de inicio.',
            ]
        );

        try {
            $existingProgrammes = Vehicleroute::where('vehicle_id', $request->vehicle_id)
                ->where('route_id', $request->route_id)
                ->whereBetween('date_route', [$request->startdate, $request->lastdate])
                ->get();

            if ($existingProgrammes->count() > 0) {
                $existingDates = $existingProgrammes->pluck('date_route')->toArray();

                $start = new DateTime($request->startdate);
                $end = new DateTime($request->lastdate);
                $interval = DateInterval::createFromDateString('1 day');
                $period = new DatePeriod($start, $interval, $end->modify('+1 day'));

                $allDatesOccupied = true;
                foreach ($period as $date) {
                    if (!in_array($date->format("Y-m-d"), $existingDates)) {
                        $allDatesOccupied = false;
                        break;
                    }
                }

                if ($allDatesOccupied) {
                    return response()->json(['message' => 'Ya existe una programación del vehículo y ruta en los días seleccionados'], 400);
                }

                $programming_id = $existingProgrammes->first()->programming_id;

                foreach ($period as $p) {
                    $date = $p->format("Y-m-d");

                    if (!in_array($date, $existingDates)) {
                        Vehicleroute::create([
                            'date_route' => $date,
                            'time_route' => $request->time_route,
                            'description' => '',
                            'vehicle_id' => $request->vehicle_id,
                            'route_id' => $request->route_id,
                            'routestatus_id' => 1,
                            'programming_id' => $programming_id,
                            'schedule_id' => $request->schedule_id
                        ]);
                    }
                }

                return response()->json(['message' => 'Fechas faltantes registradas correctamente'], 200);
            } else {
                $programming = Programming::create([
                    'startdate' => $request->startdate,
                    'lastdate' => $request->lastdate,
                ]);

                $begin = new DateTime($request->startdate);
                $last = new DateTime($request->lastdate);
                $interval = DateInterval::createFromDateString('1 day');
                $period = new DatePeriod($begin, $interval, $last->modify('+1 day'));

                foreach ($period as $p) {
                    Vehicleroute::create([
                        'date_route' => $p->format("Y-m-d"),
                        'time_route' => $request->time_route,
                        'description' => '',
                        'vehicle_id' => $request->vehicle_id,
                        'route_id' => $request->route_id,
                        'routestatus_id' => 1,
                        'programming_id' => $programming->id,
                        'schedule_id' => $request->schedule_id
                    ]);
                }

                return response()->json(['message' => 'Programación registrada exitosamente'], 200);
            }
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error: ' . $th->getMessage()], 500);
        }
    } */

    public function store(Request $request)
    {
        $request->validate(
            [
                'startdate' => 'required|date',
                'lastdate' => 'required|date|after_or_equal:startdate',
                'time_route' => 'required|date_format:H:i',
            ],
            [
                'startdate.required' => 'La fecha de inicio es obligatoria.',
                'lastdate.required' => 'La fecha de fin es obligatoria.',
                'lastdate.after_or_equal' => 'La fecha de fin debe ser igual o posterior a la fecha de inicio.',
            ]
        );

        try {
            $existingProgrammes = Vehicleroute::where('vehicle_id', $request->vehicle_id)
                ->where('route_id', $request->route_id)
                ->whereBetween('date_route', [$request->startdate, $request->lastdate])
                ->get();

            if ($existingProgrammes->count() > 0) {
                $existingDates = $existingProgrammes->pluck('date_route')->toArray();

                $start = new DateTime($request->startdate);
                $end = new DateTime($request->lastdate);
                $interval = DateInterval::createFromDateString('1 day');
                $period = new DatePeriod($start, $interval, $end->modify('+1 day'));

                $allDatesOccupied = true;
                foreach ($period as $date) {
                    if (!in_array($date->format("Y-m-d"), $existingDates)) {
                        $allDatesOccupied = false;
                        break;
                    }
                }

                if ($allDatesOccupied) {
                    return response()->json(['message' => 'Ya existe una programación del vehículo y ruta en los días seleccionados'], 400);
                }

                $programming_id = $existingProgrammes->first()->programming_id;
                $programming = Programming::find($programming_id);
                if ($programming) {
                    $programming->startdate = $request->startdate;
                    $programming->lastdate = $request->lastdate;
                    $programming->save();
                }

                // Agregar las fechas faltantes
                foreach ($period as $p) {
                    $date = $p->format("Y-m-d");

                    if (!in_array($date, $existingDates)) {
                        Vehicleroute::create([
                            'date_route' => $date,
                            'time_route' => $request->time_route,
                            'description' => '',
                            'vehicle_id' => $request->vehicle_id,
                            'route_id' => $request->route_id,
                            'routestatus_id' => 1,
                            'programming_id' => $programming_id,
                            'schedule_id' => $request->schedule_id
                        ]);
                    }
                }

                return response()->json(['message' => 'Fechas faltantes registradas correctamente'], 200);
            } else {
                $programming = Programming::create([
                    'startdate' => $request->startdate,
                    'lastdate' => $request->lastdate,
                ]);

                $begin = new DateTime($request->startdate);
                $last = new DateTime($request->lastdate);
                $interval = DateInterval::createFromDateString('1 day');
                $period = new DatePeriod($begin, $interval, $last->modify('+1 day'));

                foreach ($period as $p) {
                    Vehicleroute::create([
                        'date_route' => $p->format("Y-m-d"),
                        'time_route' => $request->time_route,
                        'description' => '',
                        'vehicle_id' => $request->vehicle_id,
                        'route_id' => $request->route_id,
                        'routestatus_id' => 1,
                        'programming_id' => $programming->id,
                        'schedule_id' => $request->schedule_id
                    ]);
                }

                return response()->json(['message' => 'Programación registrada exitosamente'], 200);
            }
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error: ' . $th->getMessage()], 500);
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
        $vehicleroute = Vehicleroute::find($id);
        $vehicles = Vehicle::pluck('name', 'id');
        $routes = Route::pluck('name', 'id');
        $routestatus = Routestatu::pluck('name', 'id');
        $time_route = Carbon::parse($vehicleroute->time_route)->format('H:i');
        $schedule = Schedules::pluck('name', 'id');

        return view('admin.programming.edit', compact('vehicleroute', 'vehicles', 'routes', 'routestatus', 'time_route', 'schedule'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $vehicleroute = Vehicleroute::find($id);

            $validate = $request->validate([
                'time_route' => 'required|date_format:H:i',
                'description' => 'nullable|string|max:255',
                'vehicle_id' => 'required|exists:vehicles,id',
                'schedule_id' => 'required|exists:schedules,id',
                'routestatus_id' => 'required|exists:routestatus,id',
            ]);

            $vehicleroute->update([
                'time_route' => $validate['time_route'],
                'description' => $validate['description'],
                'vehicle_id' => $validate['vehicle_id'],
                'schedule_id' => $validate['schedule_id'],
                'routestatus_id' => $validate['routestatus_id'],
            ]);

            return response()->json(['message' => 'Programación actualizada exitosamente'], 200);
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error en la actualización: ' . $th->getMessage()], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function searchprogramming(Request $request)
    {
        try {
            $request->validate(
                [
                    'startdate' => 'required|date',
                    'lastdate' => 'required|date|after_or_equal:startdate',
                ],
                [
                    'startdate.required' => 'La fecha de inicio es obligatoria.',
                    'lastdate.required' => 'La fecha de fin es obligatoria.',
                    'lastdate.after_or_equal' => 'La fecha de fin debe ser igual o posterior a la fecha de inicio.',
                ]
            );

            $programminglists = DB::select('CALL sp_programmingsearch(?, ?, ?, ?)', [
                $request->vehicle_id,
                $request->route_id,
                $request->startdate,
                $request->lastdate
            ]);


            foreach ($programminglists as $programminglist) {
                $programminglist->date_route = Carbon::parse($programminglist->date_route)->format('d/m/Y');
                $programminglist->time_route = Carbon::parse($programminglist->time_route)->format('H:i');
            }

            return response()->json(view('admin.programming.list', compact('programminglists'))->render());
        } catch (\Throwable $th) {
            return response()->json(['message' => '' . $th->getMessage()], 500);
        }
    }


    public function searchifexist($p)
    {
        $result = DB::select('CALL sp_search_if_exist(?, ?, ?, ?, @p_exist)', [
            $p['vehicle_id'],
            $p['route_id'],
            $p['startdate'],
            $p['lastdate']
        ]);

        $exist = DB::select('SELECT @p_exist AS p_exist');
        return $exist[0]->p_exist;
    }

    public function storeWeekdaysProgramming(Request $request)
    {
        $request->validate(
            [
                'startdate' => 'required|date',
                'lastdate' => 'required|date|after_or_equal:startdate',
                'time_route' => 'required|date_format:H:i',
            ],
            [
                'startdate.required' => 'La fecha de inicio es obligatoria.',
                'lastdate.required' => ' La fecha de fin es obligatoria.',
                'time_route.required' => ' La hora es obligatoria.',
                'lastdate.after_or_equal' => ' La fecha de fin debe ser igual o posterior a la fecha de inicio.',
            ]
        );

        try {

            $programming = [
                'startdate' => $request->startdate,
                'lastdate' => $request->lastdate,
                'vehicle_id' => $request->vehicle_id,
                'route_id' => $request->route_id,
                'schedule_id' => $request->schedule_id
            ];

            if ($this->searchifexist($programming) == 0) {
                $programming = Programming::create([
                    'startdate' => $request->startdate,
                    'lastdate' => $request->lastdate,
                ]);

                $begin = new DateTime($request->startdate);
                $last = new DateTime($request->lastdate);
                $end = $last->modify('+1 day');

                $interval = DateInterval::createFromDateString('1 day');
                $period = new DatePeriod($begin, $interval, $end);

                foreach ($period as $dt) {
                    if ($dt->format('N') < 6) {
                        Vehicleroute::create([
                            'date_route' => $dt->format("Y-m-d"),
                            'time_route' => $request->time_route,
                            'description' => '',
                            'vehicle_id' => $request->vehicle_id,
                            'route_id' => $request->route_id,
                            'routestatus_id' => 1,
                            'programming_id' => $programming->id,
                            'schedule_id' => $request->schedule_id
                        ]);
                    }
                }

                return response()->json(['message' => 'Programación registrada exitosamente (sin tomar en cuenta fines de semana)'], 200);
            } else {
                return response()->json(['message' => 'Ya existe una programación del vehículo y ruta en los días seleccionados'], 400);
            }
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error: ' . $th->getMessage()], 500);
        }
    }

    public function storeInterleavedProgramming(Request $request)
    {
        $request->validate(
            [
                'startdate' => 'required|date',
                'lastdate' => 'required|date|after_or_equal:startdate',
                'time_route' => 'required|date_format:H:i',
            ],
            [
                'startdate.required' => 'La fecha de inicio es obligatoria.',
                'lastdate.required' => ' La fecha de fin es obligatoria.',
                'lastdate.after_or_equal' => ' La fecha de fin debe ser igual o posterior a la fecha de inicio.',
                'time_route.required' => ' La hora es obligatoria.',
            ]
        );

        try {
            $programming = [
                'startdate' => $request->startdate,
                'lastdate' => $request->lastdate,
                'vehicle_id' => $request->vehicle_id,
                'route_id' => $request->route_id,
                'schedule_id' => $request->schedule_id
            ];

            if ($this->searchifexist($programming) == 0) {
                $programming = Programming::create([
                    'startdate' => $request->startdate,
                    'lastdate' => $request->lastdate,
                ]);

                $begin = new DateTime($request->startdate);
                $last = new DateTime($request->lastdate);
                $end = $last->modify('+1 day');

                $interval = DateInterval::createFromDateString('2 days');
                $period = new DatePeriod($begin, $interval, $end);

                foreach ($period as $p) {
                    Vehicleroute::create([
                        'date_route' => $p->format("Y-m-d"),
                        'time_route' => $request->time_route,
                        'description' => '',
                        'vehicle_id' => $request->vehicle_id,
                        'route_id' => $request->route_id,
                        'routestatus_id' => 1,
                        'programming_id' => $programming->id,
                        'schedule_id' => $request->schedule_id
                    ]);
                }

                return response()->json(['message' => 'Programación intercalada registrada exitosamente'], 200);
            } else {
                return response()->json(['message' => 'Ya existe una programación del vehículo y ruta en los días seleccionados'], 400);
            }
        } catch (\Throwable $th) {
            return response()->json(['message' => 'Error: ' . $th->getMessage()], 500);
        }
    }
}
