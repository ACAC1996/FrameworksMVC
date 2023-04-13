import './bootstrap';



Vue.component(
    "list-posts",
    require("./components/PostListComponent.vue").default
    
);

Vue.component(
    "modal-post",
    require("./components/PostModalComponent.vue").default
);

Vue.component(
    "post-list-default",
    require("./components/PostListDefaultComponent.vue").default
)



const app= new Vue({
    el: "#app",
    router
});