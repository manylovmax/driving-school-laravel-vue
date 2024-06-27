<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light fixed-top {{ Request::is('/site/index') || Request::is('/site/index') ? '' : 'navbar-shrink'}}" id="mainNav">
  <div class="container">
    <a class="navbar-brand js-scroll-trigger" href="/">ВОЕНМЕХ.автошкола</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
      aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link {{ App\Http\Helpers::set_active(['/', '/site', '/site/index']) }}" href="/">Главная</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  {{ App\Http\Helpers::set_active(['/site/groups']) }}" href="/site/groups">Запись</a>
        </li>
        <li class="nav-item">
          <a class="nav-link  {{ App\Http\Helpers::set_active(['/site/news']) }}" href="/site/news">Новости</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" target="_blank" href="https://vk.com/voenmeh.avtoshkola">VK</a>
        </li>



        <li class="nav-item">

          {{-- @auth('admin')
          <a class="nav-link" href="/admin">Панель управления</a> 
          @endauth 
          @auth('user')
          <a class="nav-link" href="/user">Личный кабинет</a> 
          @endauth 
          @guest('admin')
          <a class="nav-link" href="/site/login">Вход</a> 
          @endguest --}}

        </li>
      </ul>
    </div>
  </div>
</nav>