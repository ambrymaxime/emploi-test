<?php
//? --- COMMENT HELLOCSE : Création du controller de Stars
namespace App\Http\Controllers;

use DB;
use App\Models\Stars;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class StarsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $stars = Stars::select('id', 'first_name as firstName','last_name as lastName', 'description', 'thumbnail', 'created_at')
            ->orderBy('created_at','desc')
            ->get()
            ->all();

        $data = [
            'stars' => $stars,
        ];

        return view('pages.user.home')->with($data);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        $stars = Stars::select('id', 'first_name as firstName','last_name as lastName', 'description', 'thumbnail', 'created_at')
            ->orderBy('created_at','desc')
            ->get()
            ->all();

        $data = [
            'stars' => $stars,
        ];

        return view('pages.stars')->with($data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function store()
    {
        //? --- Récupération des données Axios
        $star = request('star');
        
        //? --- On vérifie aussi et surtout en back
        $validator = Validator::make($star, [
            'firstName' => 'required|max:255',
            'lastName' => 'required|max:255',
            'description' => 'required|min:100',
        ]);

        if ($validator->fails()) {
            $res = [
                'statut' => 'error',
                'message' =>  $validator->errors()->getMessages(),
                'content' => null,
            ];
        } else {
            $star['first_name'] = $star['firstName']; unset($star['firstName']);
            $star['last_name'] = $star['lastName']; unset($star['lastName']);
            $id = DB::table('stars')->insertGetId($star);
            $res = [
                'statut' => 'success',
                'message' =>  'Ajouté avec succès',
                'content' => $this->getStarById($id),
            ];
        }

        return $res;

    }

    /**
     * Update the specified resource in storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function update()
    {
        //? --- Récupération des données Axios
        $star = request('star');
        
        //? --- Validator
        $validator = Validator::make($star, [
            'firstName' => 'required|max:255',
            'lastName' => 'required',
            'description' => 'required',
        ]);

        if ($validator->fails()) {
            $res = [
                'statut' => 'error',
                'message' =>  $validator->errors()->getMessages(),
                'content' => null,
            ];
        } else {
            if (isset($star) && !empty($star)) {
                try {
                    $star['first_name'] = $star['firstName'];
                    $star['last_name'] = $star['lastName'];
                    Stars::where('id', '=', $star['id'])
                        ->firstOrFail()
                        ->update($star);
                    $res = [
                        'statut' => 'success',
                        'message' => 'Star modifiée avec succès',
                        // 'message' => trans('success.profile.edit.country'),
                        'content' => null
                    ];
                } catch (\Throwable $th) {
                    $res = [
                        'statut' => 'error',
                        'message' => 'La star ne semble pas exister',
                        'content' => null
                    ];
                }
            } else {
                $res = [
                    'statut' => 'error',
                    'message' => 'Aucune star n\'a été renseignée',
                    'content' => null
                ];
            }
        }
        
        return $res;
    }
    /**
     * Remove the specified resource from storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy()
    {
        //? --- Récupération de l'id star
        $id = request('star');

        if (isset($id)) {
            try {
                Stars::where('id', '=', $id)->delete();
                $res = [
                    'statut' => 'success',
                    'message' => 'Star retirée avec succès',
                    'content' => null
                ];
            } catch (\Throwable $th) {
                $res = [
                    'statut' => 'error',
                    'message' => 'Erreur lors de la suppression',
                    'content' => null
                ];
            }
        } else {
            $res = [
                'statut' => 'error',
                'message' => 'Aucune star à supprimer',
                'content' => null
            ];
        }

        return $res;
    }

    /**
     * Get a star by id.
     *
     * @param Integer $id
     * @return \Illuminate\Http\Response
     */
    public function getStarById($id)
    {
        try {
            Stars::findOrFail($id); 
        } catch (\Throwable $th) {
            return null;
        }

        $star = Stars::select('id', 'first_name as firstName','last_name as lastName', 'description', 'thumbnail', 'created_at')->where('id','=',$id)->get();
        return $star;
    }
}
