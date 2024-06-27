@extends('layouts.default')

@section('title', 'Автошкола в Адмиралтейском районе у метро Технологический институт от университета "ВОЕНМЕХ"')
@section('description', 'description sample')
@section('keywords', 'keywords sample')

@section('content')
  
  <div id="fb-root"></div>
  <script>
    (function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s);
      js.id = id;
      js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.11';
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
  </script>

  <header class="masthead">
    <div class="header-content">
      <div class="header-content-inner">
        <h1 id="homeHeading sr-mh" class="">Автошкола</h1>
        <br>
        <h3 class="f-Comfortaa sr-mh">Подготовка водителей транспортных средств <br>категорий «В» и «ВC»</h3>
        <br>
        <a class="btn btn-primary btn-xl js-scroll-trigger  sr-mh" href="#about">Подробнее</a>
      </div>
    </div>
  </header>

  <section class="bg-light" id="about">
    <div class="container">

      <h2 class="section-heading">о нас</h2>
      <br>
      <div class="row justify-content-center">

        <div class="col-md-7">
          <div class="card p-3 mb-3">
            <p>Университет БГТУ «ВОЕНМЕХ» им Д.Ф. Устинова на базе Автомобильно-технического учебного центра реализует образовательные программы <b>для всех желающих<sup>1</sup></b> по подготовке водителей:
            </p>
            <ul>
              <li>категории B (обучение вождению ТС с механической или автоматической коробкой передач);</li>
              <li>категории C (переподготовка с категории В).</li>
            </ul>
            <br>
            <p>Также предоставляем услугу по <b>восстановлению навыков вождения</b> (методика обучения подбирается индивидуально).</p>

            <small><sup>1</sup>На обучение могут поступить все граждане РФ или иностранные граждане, имеющее основания законного пребывания в РФ, кроме инвалидов или имеющих судимость лиц.</small>
          </div>
        </div>

        <div class="col-md-5">
          <div class="card p-3 mb-3">
            <p>Программа профессиональной подготовки водителей категорий «В» и «ВC» реализуется в БГТУ «ВОЕНМЕХ» им. Д.Ф. Устинова в соответствии с лицензией на право ведения образовательной деятельности рег. № 2238 от 28.06.2016 выданной Федеральной службой
              по надзору в сфере образования и науки, и заключением о соответствии учебно–материальной базы выданной Управлением Государственной инспекцией безопасности дорожного движения.</p>
<!--
            <a class="" target="_blank" href="http://www.gibdd.ru/r/78/drivingscools/">
Список прошедших проверку автошкол <b>на сайте ГИБДД.</b>
</a>
-->
          </div>
        </div>

      </div>
  </section>

  <section id="education" class="bg-dark">
    <div class="container">

      <h2 class="section-heading">условия</h2>
      <br>
      <div class="row justify-content-center">
        <div class="col-md-10 card p-3">


          <h4 class="text-center">Вот список наших сильных сторон:</h4>
          <ul class="list">
            <br>
            <li>теоретические занятия проходят на закрытой территории в специально оборудованных классах;</li>
            <br>
            <li>в учебном процессе используется автомобильный тренажер с моделированием дорожных ситуаций с целью подготовки слушателя к реальным условиям;</li>
            <br>
            <li>практические занятия реализуются <b>во всех районах города</b> Санкт-Петербург;</li>
            <br>
            <li>автошкола и закрытая площадка для вождения находятся в <b>100 метрах от ст. метро Технологический институт</b>;</li>
            <br>
            <li>оплату обучения можно произвести двумя равными платежами с периодом в 1 месяц;</li>
            <br>
            <li>обучение организуется в группах вечернего обучения, группах выходного дня, дневных группах;</li>
            <br>
            <li>можно <b>выбрать автомобиль</b> для прохождения практики;</li>
            <br>
            <li>можно <strong>сменить инструктора</strong> в процессе обучения.</li>
          </ul>

        </div>
      </div>

    </div>
  </section>

  <section class="p-0" id="portfolio">
    <div class="container-fluid">
      <div class="row no-gutter popup-gallery-cars">

        <div class="col-lg-4 col-sm-6">
          <a class="portfolio-box" href="/images/team/fall-winter-2017/izmaylov.JPG">
            <img class="img-fluid" src="/images/team/fall-winter-2017/izmaylov.JPG" alt="">
            <div class="portfolio-box-caption">
              <div class="portfolio-box-caption-content">
                <div class="project-category text-faded">
                  Volkswagen Polo
                </div>
                <div class="project-name">
                  Измайлов Сергей Андреевич
                </div>
              </div>
            </div>
          </a>
        </div>
        <div class="col-lg-4 col-sm-6">
          <a class="portfolio-box" href="/images/team/fall-winter-2017/savinyh.JPG">
            <img class="img-fluid" src="/images/team/fall-winter-2017/savinyh.JPG" alt="">
            <div class="portfolio-box-caption">
              <div class="portfolio-box-caption-content">
                <div class="project-category text-faded">
                  Volkswagen Polo
                </div>
                <div class="project-name">
                  Савиных Павел Вячеславович
                </div>
              </div>
            </div>
          </a>
        </div>

        <div class="col-lg-4 col-sm-6">
          <a class="portfolio-box" href="/images/team/fall-winter-2017/vishnyakov.JPG">
            <img class="img-fluid" src="/images/team/fall-winter-2017/vishnyakov.JPG" alt="">
            <div class="portfolio-box-caption">
              <div class="portfolio-box-caption-content">
                <div class="project-category text-faded">
                  Volkswagen Polo
                </div>
                <div class="project-name">
                  Вишняков Сергей Валерьевич
                </div>
              </div>
            </div>
          </a>
        </div>

        <div class="col-lg-4 col-sm-6">
          <a class="portfolio-box" href="/images/team/fall-winter-2017/sigaev.JPG">
            <img class="img-fluid" src="/images/team/fall-winter-2017/sigaev.JPG" alt="">
            <div class="portfolio-box-caption">
              <div class="portfolio-box-caption-content">
                <div class="project-category text-faded">
                  Hyundai Solaris
                </div>
                <div class="project-name">
                  Сигаев Вячеслав Иванович
                </div>
              </div>
            </div>
          </a>
        </div>

        <div class="col-lg-4 col-sm-6">
          <a class="portfolio-box" href="/images/team/fall-winter-2017/vishnyakovav.JPG">
            <img class="img-fluid" src="/images/team/fall-winter-2017/vishnyakovav.JPG" alt="">
            <div class="portfolio-box-caption">
              <div class="portfolio-box-caption-content">
                <div class="project-category text-faded">
                  Peugeot 408
                </div>
                <div class="project-name">
                  Вишняков Андрей Владимирович
                </div>
              </div>
            </div>
          </a>
        </div>

        <div class="col-lg-4 col-sm-6">
          <a class="portfolio-box" href="/images/team/fall-winter-2017/chechetkin.JPG">
            <img class="img-fluid" src="/images/team/fall-winter-2017/chechetkin.JPG" alt="">
            <div class="portfolio-box-caption">
              <div class="portfolio-box-caption-content">
                <div class="project-category text-faded">
                  Chevrolet Cruze
                </div>
                <div class="project-name">
                  Чечеткин Виталий Николаевич
                </div>
              </div>
            </div>
          </a>
        </div>

      </div>
    </div>
  </section>

  <section id="education" class="bg-light">
    <div class="container">

      <h2 class="section-heading">площадка</h2>
      <br>

      <div class="row justify-content-center">
        <div class="col-md-10 card p-3">

          <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">

            <div class="carousel-inner">
              <div class="carousel-item active">
                <img class="d-block w-100" src="/images/platform/1.JPG" alt="First slide">
              </div>
              <div class="carousel-item ">
                <img class="d-block w-100" src="/images/platform/2.JPG" alt="Second slide">
              </div>
              <div class="carousel-item ">
                <img class="d-block w-100" src="/images/platform/3.JPG" alt="Third slide">
              </div>
              <div class="carousel-item ">
                <img class="d-block w-100" src="/images/platform/4.JPG" alt="Fourth slide">
              </div>
              <div class="carousel-item ">
                <img class="d-block w-100" src="/images/platform/5.JPG" alt="Fifth slide">
              </div>
            </div>

            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

        </div>
      </div>

    </div>
  </section>

  <section id="groups" class="bg-dark">
    <div class="container">

      <h2 class="section-heading">группы</h2>
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

  <section id="contacts" class="bg-light">
    <div class="container">

      <h2 class="section-heading">контакты</h2>
      <br>
      <div class=" card">

        <div id="map"></div>
        <script>
          function initMap() {
            var uluru = {
              lat: 59.9163774,
              lng: 30.3136526
            };
            var map = new google.maps.Map(document.getElementById('map'), {
              zoom: 16,
              center: uluru
            });
            var marker = new google.maps.Marker({
              position: uluru,
              map: map
            });
          }
        </script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=<KEY_HERE>&callback=initMap">
        </script>
        <br>
        <div class="row">
          <div class="col-md-10 mx-auto">
            <br>
            <p class="h3">Адрес: 1-я Красноармейская ул. 1, Санкт-Петербург</p>
            <br>
            <div class="row">
              <div class="col-md-6 text-center">
                <i class="fa fa-phone fa-3x sr-contact"></i>
                <p>+7 (911) 123 4567</p>
                <p>по будням с 9 до 17 часов</p>
              </div>
              <div class="col-md-6 text-center">
                <i class="fa fa-envelope-o fa-3x sr-contact"></i>
                <p>
                  <a href="mailto:volovik_ov@bstu.spb.su">volovik_ov@bstu.spb.su</a>
                </p>
              </div>
              <div class="col-md-6 text-center">
                <hr>
                <p>Чаплыгин Анатолий Сергеевич</p>
                <p>+7 (999) 028-28-96</p>
              </div>
            </div>
          </div>

        </div>
        <div class="row justify-content-center">

          <div class="col-md-4">
            <span id="vk_groups"></span>
            <script type="text/javascript">
              VK.Widgets.Group("vk_groups", {
                mode: 0,
                width: 300,
                height: 160,
                color1: 'FFFFFF',
                color2: '2B587A',
                color3: '5B7FA6'
              }, 108946337);
            </script>
          </div>

          <div class="col-md-4">
            <div class="fb-page" data-height="300" data-href="https://www.facebook.com/bstuattcru" data-tabs="timeline" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
              <blockquote cite="https://www.facebook.com/bstuattcru" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/bstuattcru">Автошкола университета Военмех</a></blockquote>
            </div>
          </div>

        </div>
      </div>

  </section>

  <!--

<section class="bg-primary">
<div class="container">
<div class="row">
<div class="col-lg-8 mx-auto text-center">
<h2 class="section-heading text-white">Приглашаем на Обучение</h2>
<p class="text-faded">
Цена на курсы обучения в нашей автошколе составляет 21 тыс. рублей. Оплату можно произвести в рассрочку пополам.
</p>
<a class="btn btn-default btn-xl sr-button js-scroll-trigger" href="#services">записаться</a>
</div>
</div>
</div>
</section>
-->
  <section id="partners" class="bg-dark">
    <div class="container">
      <h2 class="section-heading">Партнеры</h2>
      <br>
      <div class="row justify-content-center">

        <div class="col-md-4">
          <div class="partner card text-center p-3">
            <a href="http://megapolis-car.ru/" class="partner-logo"><img class="img-fluid sr-button" src="/images/logos/megapolis.png"></a>
            <div class="partner-title h3">Атошкола "Мегаполис"</div>
          </div>
        </div>

        <div class="col-md-4">
          <div class="partner card text-center p-3">
            <a href="http://auto.igps.ru/" class="partner-logo"><img class="img-fluid sr-button" src="/images/logos/logo_ugps.png"></a>
            <div class="partner-title h3">Государственная автошкола МЧС</div>
          </div>
        </div>

      </div>
    </div>
  </section>
@endsection