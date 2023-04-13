<footer class="page-footer bg-dark">
    <div class="container">
        <div class="row">
            <div class="col-md-12 py-5">
                <div class="mb-5 flex-center">
                    <a class="fb-ic">
                        <i class="fab fa-facebook-f fa-lg white-text mr-md-5 mr-3 fa-2x"></i>
                    </a>
                    <a class="tw-ic">
                        <i class="fab fa-twitter fa-lg white-text mr-md-5 mr-3 fa-2x"></i>
                    </a>
                    <a class="li-ic">
                        <i class="fab fa-linkedin-in fa-lg white-text mr-md-5 mr-3 fa-2x"></i>
                    </a>
                    <a class="ins-ic">
                        <i class="fab fa-instagram fa-lg white-text mr-md-5 mr-3 fa-2x"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="bg-dark2 footer-copyright text-center py-3 text-white">{{ date('Y') }} Copyright:
        <router-link to="/" class="text-white">IU Digital de Antioquia</router-link>
        <router-link class="text-white" :to="{name: 'contact',}"><u>Frameworks MVC</u></router-link>
    </div>
</footer>