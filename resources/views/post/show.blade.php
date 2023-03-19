@extends('layouts.app')

@section('template_title')
    {{ $post->name ?? "{{ __('Show') Post" }}
@endsection

@section('content')
    <section class="content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="float-left">
                            <span class="card-title">{{ __('Ver') }} Post</span>
                        </div>
                        <div class="float-right">
                            <a class="btn btn-primary" href="{{ route('posts.index') }}"> {{ __('Atrás') }}</a>
                        </div>
                    </div>

                    <div class="card-body">
                        
                        <div class="form-group">
                            <strong>Nombre:</strong>
                            {{ $post->name }}
                        </div>
                        <div class="form-group">
                            <strong>Categoría:</strong>
                            {{ $post->category_id }}
                        </div>
                        <div class="form-group">
                            <strong>Descripción:</strong>
                            {{ $post->description }}
                        </div>
                        <div class="form-group">
                            <strong>Estado Publicación:</strong>
                            {{ $post->state }}
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
