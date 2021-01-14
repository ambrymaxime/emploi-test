Vue.component('stars-page', {
    props: {
        vStars: null,
    },
    data() {
        //? --- COMMENT HELLOCSE : Je passe mes props en variable afin de les manipuler en cas d'ajout d'une star pour qu'elle s'affiche direcement
        return {
            stars: this.vStars ? this.vStars : [],
            currentStar: this.vStars[0],
        }
    },
    methods: {
        setCurrentStar(index) {
            this.currentStar = this.stars[index];
        },
        show() {
            const t = this;
            axios.post('/starAdd', {
                star: this.newStar
            }).then(function (response) {
                if (response.data.statut == 'success') {
                    t.stars.unshift(response.data.content[0]);
                    t.nbStars++;
                    t.reset();

                    t.success = response.data.message;
                    t.$refs.success.hidden = false;
                    setTimeout(function () { 
                        t.success = null;
                        t.$refs.success.hidden = true;
                     }, 3000);
                } else {
                    t.errors = response.data.message;
                    t.checkFields();
                }
            });
        },

    },
});