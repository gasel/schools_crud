<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Student;
use App\Http\Resources\StudentResource;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return StudentResource::collection(Student::with('school')->orderByDesc('created_at')->paginate(10));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50',
            'surname' => 'required|string|max:50',
            'birthdate' => 'required|date',
            'city' => 'required|string|max:50',
            'school.id' => 'required|exists:schools,id'
        ]);

        return Student::create([
           'name' => $request['name'],
           'surname' => $request['surname'],
           'birthdate' => date('Y-m-d', strtotime($request['birthdate'])),
           'city' => $request['city'],
           'school_id' => $request['school.id']
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50',
            'surname' => 'required|string|max:50',
            'birthdate' => 'required|date',
            'city' => 'required|string|max:50',
            'school.id' => 'required|exists:schools,id'
        ]);

        $student = Student::findOrFail($id);

        $student->update([
           'name' => $request['name'],
           'surname' => $request['surname'],
           'birthdate' => date('Y-m-d', strtotime($request['birthdate'])),
           'city' => $request['city'],
           'school_id' => $request['school.id']
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $student = Student::findOrFail($id);
        $student->delete();
        return response()->json([
         'message' => 'Student deleted successfully'
        ]);
    }
}
