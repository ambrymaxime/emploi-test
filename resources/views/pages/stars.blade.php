@extends('layouts.app')

@section('template_title')
    Artistes
@endsection

@section('template_fastload_css')
@endsection

@section('content')

{{-- //? --- COMMENT HELLOCSE : Je donne mes données à VueJS pour gérer l'affichage uniquement en front afin d'éviter des chargements de page, manipuler plus facilement les changements de valeurs et donner un retour immédiat à l'utilisateur --}}
<stars-page inline-template v-cloak :v-stars="{{ json_encode($stars) }}">
    
    <div class="uk-width-1-1 uk-margin-auto background-white stars" uk-height-viewport>

        <div class="star uk-width-1-1@s uk-margin-auto uk-flex">

            <div class="uk-width-1-4@s">
                <div class="star-logo uk-flex uk-flex-middle">
                    <img class="radius-20 uk-margin-right" src="/images/logo_hellocse_blue.jpg" alt="Logo">
                    <div>
                        <p class="star-logo__brand uk-margin-remove">HelloCSE</p>
                        <p class="uk-margin-remove">Réalisé par <a href="https://www.maxime-ambry.fr">Maxime Ambry</a></p>
                    </div>
                </div>
                <a class="star-add hover-contrast" href="{{ route('home') }}">
                    Ajouter une star
                </a>
                <ul class="star-list uk-width-1-1@s uk-list">
                    <li v-for="(star, index) in stars">
                        <a @click="setCurrentStar(index)" :class="{'star-active' : currentStar.id == star.id}" class="uk-flex uk-flex-middle" href="#">
                            <span v-if="currentStar.id == star.id" uk-icon="minus" class="uk-margin-right"></span>
                            @{{ star.firstName }} 
                        </a>
                        <div v-if="currentStar.id == star.id" class="uk-hidden@s">
                            <Star 
                                class="star-component"
                                :firstname="star.firstName"
                                :lastname="star.lastName"
                                :description="star.description"
                                :thumbnail="star.thumbnail"
                                :date="star.created_at">
                            </Star>
                        </div>
                    </li>
                </ul>
            </div>


            <div class="star-panel uk-width-3-4@s uk-visible@s">

                <div class="star-header">
                    <h1>Vos artistes favoris !</h1>
                    <p>Consultez la liste de vos artistes préféré afin d'en apprendre un peu plus sur eux ! </p>
                </div>

                <Star 
                    class="star-component uk-height-viewport"
                    :firstname="currentStar.firstName"
                    :lastname="currentStar.lastName"
                    :description="currentStar.description"
                    :thumbnail="currentStar.thumbnail"
                    :date="currentStar.created_at">
                </Star>
            </div>
        </div>
    </div>

</stars-page>
@endsection

@section('footer_scripts')
@endsection
