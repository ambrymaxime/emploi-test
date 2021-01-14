@extends('layouts.app')

@section('content')
{{-- //? --- COMMENT HELLOCSE : Login avec traduction et illustration --}}
<div uk-grid uk-height-viewport>
    <div class="uk-flex uk-flex-middle login-left">
        <div class="uk-text-left login-left-content">
            <h1 class="uk-text-left">
                {{ trans('titles.login') }}
            </h1>
            <form method="POST" action="{{ route('login') }}">
                @csrf

                <div class="form-group">
                    <label class="uk-width-1-1" for="email">{{ __('E-Mail Address') }}</label>
                    <div>
                        <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus>
                        @if ($errors->has('email'))
                            <span class="invalid-feedback">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

                <div class="form-group">
                    <label class="uk-width-1-1" for="password">{{ __('Password') }}</label>
                    <div>
                        <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>
                        @if ($errors->has('password'))
                            <span class="invalid-feedback">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>

                <div>
                    <div>
                        <button type="submit" class="uk-button background-contrast text-light">
                            {{ __('Login') }}
                        </button>
                    </div>
                </div>

            </form>
        </div>
    </div>
    <div class="uk-flex uk-flex-middle login-right">
        <div class="uk-text-center uk-width-1-1">
            {{-- <img src="https://www.hellocse.fr/images/all-mockups-home.png" alt="Login" width="55%"> --}}
            <h1 class="text-light uk-margin-top">
               Créateur de satisfaction.
            </h1>
            <p class="text-light">
                Billetterie, outils de gestion et de communication pour CE, CSE & PME
            </p>
        </div>
    </div>
</div>
@endsection
