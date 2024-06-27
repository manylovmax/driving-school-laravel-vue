@extends('layouts.default')

@section('title', 'Автошкола в Адмиралтейском районе у метро Технологический институт от университета "ВОЕНМЕХ"')
@section('description', 'description sample')
@section('keywords', 'keywords sample')

@section('content')

  <section id="groups" class="bg-dark">
    <div class="container">

      <h2 class="section-heading">выберите группу</h2>
      <br>
      <div class="row justify-content-center">

      @forelse ($Groups as $Group)
        <div class="col-md-4">
            <div class="card text-center">
              <form action="/site/application" method="get">
                <input type="hidden" name="group" value="{{ $Group->id }}">
                <div class="card-body">
                  <h4 class="card-title">{{$Group->title}}</h4>
                </div>
                <ul class="list-group list-group-flush">
                  @if ($Group->price == $Group->price_for_students )
                    <li class="list-group-item">Стоимость обучения
                      <br> <strong>{{ $Group->price ? number_format($Group->price, 0, '.', ' ') : '23&nbsp;000' }}</strong> рублей
                    </li>
                  @else
                    <li class="list-group-item">Стоимость обучения
                      <br> <strong>{{ $Group->price ? number_format($Group->price, 0, '.', ' ') : '23&nbsp;000' }}</strong> рублей
                      <hr> для студентов
                      <br> стоимость обучения
                      <br> <strong>{{ $Group->price_for_students ? number_format($Group->price_for_students, 0, '.', ' ') : '21&nbsp;000' }}</strong> рублей
                    </li>
                  @endif

                    <li class="list-group-item">Дни недели <strong>{{ $Group->timetable ? implode(', ', json_decode($Group->timetable)) : 'не задано' }}</strong></li>
                    <li class="list-group-item">Часы <strong>{{ $Group->hours_start_at ? date('H:i', strtotime($Group->hours_start_at)) : '' }}
- {{ $Group->hours_finish_at ? date('H:i', strtotime($Group->hours_finish_at)) : '' }}</strong></li>
                    <li class="list-group-item">Начало обучения <strong>{{ $Group->start_at ? date('d-m-Y', strtotime($Group->start_at)) : '' }}</strong></li>
                </ul>
                <div class="card-body text-center">
                  <button class="btn btn-primary btn-xl js-scroll-trigger" type="submit">записаться</button>
                </div>
              </form>
            </div>
          </div>
    @empty
      <div class="col-md-4">
        <div class=" card">
          <p>На данный момент нет открытых групп.</p>
        </div>
      </div>
    @endforelse

      </div>
    </div>
  </section>

@endsection