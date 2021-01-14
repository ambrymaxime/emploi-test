@extends('layouts.app')

@section('template_title')
    Gérez vos stars
@endsection

@section('template_fastload_css')
@endsection

@section('content')

{{-- //? --- COMMENT HELLOCSE : Je donne mes données à VueJS pour gérer l'affichage uniquement en front afin d'éviter des chargements de page, manipuler plus facilement les changements de valeurs et donner un retour immédiat à l'utilisateur --}}
<home-page inline-template v-cloak :v-stars="{{ json_encode($stars) }}">

    
    <div class="uk-width-1-2@m uk-margin-auto background-white" uk-height-viewport="expand: true">

        <div id="modal-remove"  class="uk-flex-top" uk-modal>
            <div v-if="startToRemove" class="uk-modal-dialog uk-modal-body uk-padding uk-margin-auto-vertical">
                <h2 class="uk-modal-title">Vous allez supprimer <b>@{{ startToRemove.firstName }}</b></h2>
                <p>
                    Voulez-vous vraiment allez supprimer <b>@{{ startToRemove.firstName }} @{{ startToRemove.lastName }}</b> définitivement ?
                </p>
                <p class="uk-text-left">
                    <button class="uk-button uk-button-default uk-modal-close" type="button">Annuler</button>
                    <button @click="remove()" class="uk-button background-danger text-light" type="button">Supprimer</button>
                </p>
            </div>
        </div>
        
        <div ref="success" class="background-success uk-padding-small" hidden>
            <p class="text-light uk-margin-remove">
                <span class="uk-margin-small-right" uk-icon="check"></span> @{{ success }}
            </p>
        </div>

        <div class="uk-width-1-1@s uk-padding">
            <ul uk-accordion="multiple: true">
                    {{-- Ajout --}}
                    <li class="uk-open">
                        <a class="uk-accordion-title" href="#">
                            <span v-html="action"></span> une star
                        </a>
                        <div class="uk-accordion-content">
                            {{-- //? --- COMMENT HELLOCSE : Ammélioration possible - Faire un component du champ input --}}
                            <form id="form">
                                <div class="uk-margin">
                                    <label for="firstName">Prénom</label>
                                    <input @input="checkFields()" v-model="newStar.firstName" name="firstName" class="uk-input" :class="{'field-danger' : errors.firstName }" type="text" placeholder="John">
                                    <p class="uk-margin-small-top" :class="{'text-danger' : errors.firstName }" v-if="errors.firstName">
                                        Renseignez moins de 255 caractères
                                    </p>
                                </div>
                                <div class="uk-margin">
                                    <label for="lastName">Nom</label>
                                    <input @input="checkFields()" v-model="newStar.lastName" name="lastName" class="uk-input" :class="{'field-danger' : errors.lastName }" type="text" placeholder="Doe">
                                    <p class="uk-margin-small-top" :class="{'text-danger' : errors.lastName }" v-if="errors.lastName">
                                        Renseignez moins de 255 caractères
                                    </p>
                                </div>
                                <div class="uk-margin">
                                    <label for="description">Description</label>
                                    <textarea @input="checkFields()" v-model="newStar.description" name="description" class="uk-textarea" :class="{'field-danger' : errors.description }" rows="5"></textarea>
                                    <p class="uk-margin-small-top" :class="{'text-danger' : errors.description }" v-if="errors.description">
                                        Renseignez au moins 100 caractères
                                    </p>
                                </div>
                            </form>
                            <p v-if="errors && typeof errors == 'string'" class="uk-margin-small-top text-danger">
                                @{{ errors }}
                            </p>
                            <template v-if="canCreateAStar">
                                <button @click="add()" v-if="!newStar.id"  class="uk-button uk-width-1-1 text-light background-contrast">
                                    Créer
                                </button>
                                <button @click="edit()" v-if="newStar.id" type="button" class="uk-button uk-width-1-1 text-light background-contrast">
                                    Modifier
                                </button>
                            </template>
                        </div>
                    </li>
                    {{-- Liste --}}
                    <li>
                        <a class="uk-accordion-title" href="#">Consulter les stars (@{{ nbStars }}) </a>
                        <div class="uk-accordion-content">
                            <div class="uk-width-1-1@s">
                                <table class="uk-table uk-table-divider uk-table-middle uk-table-responsive">
                                    <thead>
                                        <tr>
                                            <th class="uk-table-shrink"></th>
                                            <th class="uk-table-shrink">Image</th>
                                            <th class="uk-table-shrink">Prénom</th>
                                            <th class="uk-table-shrink">Nom</th>
                                            <th class="uk-table-expand">Descriptions</th>
                                            <th class="uk-width-auto">Création</th>
                                            <th class="uk-width-auto uk-text-nowrap">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {{-- //? --- COMMENT HELLOCSE : J'affiche mes stars avec VueJS --}}
                                        <tr v-for="(star, index) in stars">
                                            <td><input class="uk-checkbox" type="checkbox"></td>
                                            <td class="uk-text-center"><img class="uk-preserve-width uk-border-circle" :src="star.thumbnail" width="40" alt=""></td>
                                            <td>@{{ star.firstName }}</td>
                                            <td>@{{ star.lastName }}</td>
                                            <td class="uk-text-truncate">@{{ star.description }}</td>
                                            <td class="uk-text-capitalize">@{{ star.created_at | formatFrenchDate() }}</td>
                                            <td>
                                                <div class="uk-width-auto">
                                                    <ul class="uk-iconnav">
                                                        <li><a uk-tooltip="title: Voir; pos: bottom" href="{{ route('stars') }}" uk-icon="icon: link"></a></li>
                                                        <li><a @click="askForEdit(star)" uk-tooltip="title: Éditer; pos: bottom" href="#" uk-icon="icon: pencil"></a></li>
                                                        <li><a @click="askForRemove(star)" uk-toggle="target: #modal-remove" uk-tooltip="title: Supprimer; pos: bottom" href="#" uk-icon="icon: trash"></a></li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
    </div>

</home-page>
@endsection

@section('footer_scripts')
@endsection
