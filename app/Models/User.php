<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Laravel\Jetstream\HasProfilePhoto;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use Notifiable;
    use TwoFactorAuthenticatable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $guarded = [];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_recovery_codes',
        'two_factor_secret',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array<int, string>
     */
    protected $appends = [
        'profile_photo_url',
    ];

    public function usertype()
    {
        return $this->belongsTo(Usertype::class, 'usertype_id', 'id');
    }

    protected $table = 'users';

    public function adminlte_image()
    {
        // Verificar si el usuario tiene una imagen de perfil
        if ($this->profile_photo_path) {
            // Si existe una imagen, retornamos la URL completa
            return asset($this->profile_photo_path);
        }

        return asset('storage/user_logo/no_image.png');
        //return 'https://picsum.photos/300/300'; // O cualquier imagen predeterminada
    }


    public function adminlte_desc()
    {
        $usertype = auth()->user()->usertype;
        if ($usertype) {
            return $usertype->name;
        }

        return "Sin asignar tipo de usuario";
    }
}
