Vue.component('home-page', {
    props: {
        vStars: null,
    },
    data() {
        //? --- COMMENT HELLOCSE : Je passe mes props en variable afin de les manipuler en cas d'ajout d'une star pour qu'elle s'affiche direcement
        return {
            stars: this.vStars ? this.vStars : [],
            nbStars: this.vStars.length,
            canCreateAStar: false,
            starToEdit: null,
            startToRemove: null,
            newStar: {
                firstName: null,
                lastName: null,
                description: null,
            },
            errors: {
                firstName: false,
                lastName: false,
                description: false,
            },
            success: null,
        }
    },
    methods: {
        //? --- AJOUT
        checkFields() {
            if (this.newStar.firstName && this.newStar.firstName.length > 0 && this.newStar.firstName.length > 255) {
                this.errors.firstName = true;
            } else {
                this.errors.firstName = false;
            }

            if (this.newStar.lastName && this.newStar.lastName.length > 0 && this.newStar.lastName.length > 255) {
                this.errors.lastName = true;
            } else {
                this.errors.lastName = false;
            }

            if (this.newStar.description && this.newStar.description.length > 0 && this.newStar.description.length < 100) {
                this.errors.description = true;
            } else {
                this.errors.description = false;
            }

            if (this.errors.firstName || this.errors.lastName || this.errors.description) {
                this.canCreateAStar= false;
            } else {
                if (this.newStar.firstName && this.newStar.lastName && this.newStar.description) {
                    this.canCreateAStar= true;
                } else {
                    this.canCreateAStar = false;
                }
            }
        },
        test() {
            this.$refs.success.hidden = false;
        },
        add() {
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
        //? --- EDIT
        askForEdit(starToEdit) {
            this.starToEdit = starToEdit.id;
            this.newStar = starToEdit;
            this.checkFields();
        },
        edit() {
            const t = this;
            axios.post('/starEdit', {
                star: this.newStar
            }).then(function (response) {
                if (response.data.statut == 'success') {
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
        //? --- DELETE
        askForRemove(starToRemove) {
            this.startToRemove = starToRemove;
        },
        remove() {
            const t = this;
            var id = this.startToRemove.id;
            axios.post('/starRemove', {
                star: id
            }).then(function (response) {
                UIkit.modal('#modal-remove').hide();
                if (response.data.statut == 'success') {

                    t.stars.forEach((element, index) => {
                        if (element.id == id) {
                            t.stars.splice(index, 1);
                            t.nbStars--;
                        }
                    })
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
        //? --- GLOBAL
        reset() {
            Vue.delete(this.newStar, 'id');
            this.canCreateAStar = false;
            this.starToEdit = null;
            this.starToRemove = null;
            this.newStar.firstName = null;
            this.newStar.lastName = null;
            this.newStar.description = null;
            this.errors.firstName = false;
            this.errors.lastName = false;
            this.errors.description = false;
            this.success = null;
        }

    },
    computed: {
        action: function () {
            return this.newStar.id ? 'Éditer' : 'Ajouter';
        }
    },
    watch: {
        errors: {
            handler() {
            },
            deep: true
        }
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
                weekday: "short",
                year: "numeric",
                month: "long",
                day: "numeric",
            };
            return event.toLocaleDateString("fr-FR", options);
        }
    }
});