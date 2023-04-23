@extends('layouts.app')

@section('template_title')
    {{ $reply->name ?? __('Show')  }} Reply
@endsection

@section('content')
    <section class="content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="float-left">
                            <span class="card-title">{{ __('Show') }} Reply</span>
                        </div>
                        <div class="float-right">
                            <a class="btn btn-primary" href="{{ route('replies.index') }}"> {{ __('Back') }}</a>
                        </div>
                    </div>

                    <div class="card-body">
                        
                        <div class="form-group">
                            <strong>Nombre del Post:</strong>
                            {{ $reply->post->name }}
                        </div>
                        <div class="form-group">
                            <strong>Respuesta:</strong>
                            {{ $reply->respuesta }}
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
