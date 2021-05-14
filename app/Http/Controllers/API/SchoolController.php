<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\School;
use Intervention\Image\Facades\Image as Image;
use App\Http\Resources\SchoolResource;


class SchoolController extends Controller
{
    /**
     * Display a listing of all results from the model.
     *
     * @return \Illuminate\Http\Response
     */
    public function getAll()
    {
        return School::latest()->get();
    }
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return SchoolResource::collection(School::orderByDesc('created_at')->paginate(5));
    }

    /**
     * Generate the image file name to be stored, based in the current time.
     *
     * @param  String  $input
     * @return String
     */
	private function generateFileName($input) {
		$name = uniqid().'.' . $input;
		
		if (file_exists($name)) { // Name already occupied. Generate filename with uniqid with more entropy
			$name = uniqid(true).'.' . $input;
		}
		
		return $name;
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
            'name' => 'required|string|max:100',
            'address' => 'required|string|max:100',
            'logo' => 'required|image|max:2048|dimensions:min_width=200,min_height=200',
            'email' => 'required|email',
            'phone' => 'required|string|max:50',
            'website' => 'required|url|max:100'
        ]);

        if ($request['logo']) {
			$name = $this->generateFileName($request['logo']->getClientOriginalName());

            Image::make($request->file('logo')->getRealPath())->save(storage_path('app/public/school_logos/').$name);
		}
        
        return School::create([
           'name' => $request['name'],
           'address' => $request['address'],
           'logo' => $name,
           'email' => $request['email'],
           'phone' => $request['phone'],
           'website' => $request['website'],
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
        if (empty($request['logo_name'])) { // logo_name indicates the logo has been modified (if empty)
			$this->validate($request, [
				'name' => 'required|string|max:100',
				'address' => 'required|string|max:100',
				'logo' => 'required|image|max:2048|dimensions:min_width=200,min_height=200',
				'email' => 'required|email',
				'phone' => 'required|string|max:50',
				'website' => 'required|url|max:100'
			]);
		} else {
			$this->validate($request, [
				'name' => 'required|string|max:100',
				'address' => 'required|string|max:100',
				'email' => 'required|email',
				'phone' => 'required|string|max:50',
				'website' => 'required|url|max:100'
			]);
		}

        $school = School::findOrFail($id);
        
        $currentLogo = $school['logo'];

        if (!empty($request['logo_name'])) {
			
			$logoname = $request['logo_name'];
			
		} else if (empty($request['logo_name']) && $request['logo']->getClientOriginalName() != $currentLogo) {
			
			$logoname = $this->generateFileName($request['logo']->getClientOriginalName());

            Image::make($request->file('logo')->getRealPath())->save(storage_path('app/public/school_logos/').$logoname);

            $schoolLogo = storage_path('school_logos/').$currentLogo;

            if (file_exists($schoolLogo)) {

                @unlink($userPhoto);
                
            }
		}
		
        $school->update([
           'name' => $request['name'],
           'address' => $request['address'],
           'logo' => $logoname,
           'email' => $request['email'],
           'phone' => $request['phone'],
           'website' => $request['website'],
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
        $school = School::findOrFail($id);
        $school->delete();

        $currentLogo = $school['logo'];
        
		$schoolLogo = storage_path('school_logos/').$currentLogo;

		if (file_exists($schoolLogo)) {

			@unlink($userPhoto);
			
		}
		
        return response()->json([
         'message' => 'School deleted successfully'
        ]);
    }
}
