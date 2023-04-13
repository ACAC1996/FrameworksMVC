<template>
    <div>
        <div class="card mt-3" v-for="item_post in posts" :key="post.title">
            <img :src="'/images/'+post.image" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">@{{ item_post.title }}</h5>
              <p class="card-text">@{{ item_post.content }}</p>
              <a href="#" class="btn btn-primary" v-on:click="postClick">Ver más</a>
            </div>
        </div>
        <modal-post @closeModalPost="closeModalPost" :item_post="postSelected"></modal-post>
    </div>
</template>
<script>
    export default {
        methods:{
            postClick:function(p){
                this.postSelected=p;
                $("#postModal").modal("show");
            }
        },
        props:['title','posts'],
        data:  function(){
            return {
                postSelected:"",
                posts:[{
                    title: "Cursos nuevos IU Digital de Antioquia",
                    image: "1679247956.png",
                    content: "lorem1"
                },
                {
                    title: "Cursos Frameworks MVC",
                    image: "1679248086.png",
                    content: "lorem2"
                },
                {
                    title: "Curso Desarrollo móvil",
                    image: "1679248089.png",
                    content:"lorem3"
                },
                ]
            }
        }
    };
</script>