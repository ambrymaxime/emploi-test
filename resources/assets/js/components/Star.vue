//? --- COMMENT HELLOCSE : Création d'un component Star pour affichage
<template>
    <div>
        <div class="star-card uk-child-width-2-3@m">
            <div class="star-card__section uk-card-header radius-20">
                <div class="uk-grid-small uk-flex-middle" uk-grid>
                    <div class="uk-width-auto">
                        <img class="radius-20" width="65" height="65" :src="thumbnail">
                    </div>
                    <div class="uk-width-expand">
                        <h3 class="uk-card-title uk-margin-remove-bottom">{{ firstname }} {{ lastname }}</h3>
                        <p class="uk-text-meta uk-margin-remove-top"><time :datetime="date">{{ date | formatFrenchDate }}</time></p>
                    </div>
                </div>
            </div>

            <div class="star-card__section uk-card-body radius-20">
                <p>{{ description }}</p>
            </div>

            <div class="star-card__section uk-card-footer radius-20">
                <p>Note : 5/5</p>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Star",
		props: {
			firstname: {
				type: String,
			},
			lastname: {
				type: String,
			},
			description: {
				type: String,
			},
			thumbnail: {
				type: String,
			},
			date: {
				type: String,
			}
		},
        mounted() {
        },
        filters: {
            formatFrenchDate(date) {
                //? --- Je split ma date pour fix le NaN de version IOs
                var arr = date.split(/[- :]/);
                var d = new Date(arr[0], arr[1] - 1, arr[2].split('T')[0]);
                const event = new Date(
                    d.getFullYear(),
                    d.getMonth(),
                    d.getDate(),
                    d.getHours(),
                    d.getMinutes(),
                    d.getSeconds()
                );
                
                var options = {
                    year: "numeric",
                    month: "long",
                    day: "numeric",
                };
                return event.toLocaleDateString("fr-FR", options);
            }
        }
        
    }
</script>
