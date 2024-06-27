<template>
  <div>
    <header class="masthead">
      <div class="header-content">
        <div class="header-content__inner">
          <h1 id="homeHeading" class>Автошкола БГТУ «ВОЕНМЕХ»</h1>
          <br />
          <h3 class="f-Comfortaa">
            Подготовка водителей
            <br />в центре Санкт-Петербурга
          </h3>
        </div>
      </div>
      <transition name="fade">
        <div v-show="!scrolled" class="scroll-downs">
          <div class="mousey">
            <div class="scroller"></div>
          </div>
        </div>
      </transition>
    </header>

    <section id="about" class="bg-dark">
      <div class="container">
        <h1 class="section-heading text-center">о нас</h1>
        <br />
        <div class="row justify-content-center">
          <div class="col-md-6">
            <div class="card mb-3">
              <p>
                Университет БГТУ «ВОЕНМЕХ» им Д.Ф. Устинова на базе Автомобильно-технического учебного центра реализует образовательные программы
                <b>
                  для всех желающих
                </b> по подготовке водителей:
              </p>
              <ul>
                <li>категории B (обучение вождению ТС с механической или автоматической коробкой передач);</li>
                <li>категории C (переподготовка с категории В).</li>
              </ul>
              <br />
              <p>
                Также предоставляем услугу по
                <b>восстановлению навыков вождения</b> (методика обучения подбирается индивидуально).
              </p>
            </div>
          </div>

          <div class="col-md-6">
            <div class="card mb-3">
              <p>
                Программа профессиональной подготовки водителей категорий «В» и «ВC» реализуется в БГТУ «ВОЕНМЕХ» им. Д.Ф. Устинова в соответствии с лицензией на право ведения образовательной деятельности рег. № 2238 от 28.06.2016 выданной Федеральной службой
                по надзору в сфере образования и науки, и заключением о соответствии учебно–материальной базы выданной Управлением Государственной инспекцией безопасности дорожного движения.
              </p>
              <a
                class="text-underline"
                target="_blank"
                href="https://xn--90adear.xn--p1ai/drivingschools/"
              >
                Список прошедших проверку автошкол
                <b>на сайте ГИБДД.</b>
              </a>
            </div>
          </div>
        </div>

        <div class="row justify-content-center">
          <div class="col-md-12">
            <div class="card">
              <ul class="list">
                <h2 class="section-heading text-center">условия</h2>
                <br />
                <li>теоретические занятия проходят на закрытой территории в специально оборудованных классах;</li>
                <br />
                <li>в учебном процессе используется автомобильный тренажер с моделированием дорожных ситуаций с целью подготовки слушателя к реальным условиям;</li>
                <br />
                <li>
                  практические занятия реализуются
                  <b>во всех районах города</b> Санкт-Петербург;
                </li>
                <br />
                <li>
                  автошкола и закрытая площадка для вождения находятся в
                  <b>100 метрах от ст. метро Технологический институт</b>;
                </li>
                <br />
                <li>оплату обучения можно произвести двумя равными платежами с периодом в 1 месяц;</li>
                <br />
                <li>обучение организуется в группах вечернего обучения, группах выходного дня, дневных группах;</li>
                <br />
                <li>
                  можно
                  <b>выбрать автомобиль</b> для прохождения практики;
                </li>
                <br />
                <li>
                  можно
                  <strong>сменить инструктора</strong> в процессе обучения.
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="bg-light">

      <div class="container">
        <div class="row justify-content-center">
          <div class="clo-md-12">
            <h1 class="section-heading text-center">материальная база</h1>
            <hr />
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-md-12 text-center">
            <h2 class="section-heading">инструкторы и их учебное авто</h2>
          </div>
        </div>
      </div>

      <div class="container-fluid">
        <div class="row no-gutter popup-gallery-cars">
          <div class="col-lg-4 col-sm-6">
            <div class="portfolio-box">
              <img class="img-fluid" src="/images/team/1.JPG" alt />
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-name">Сергей Андреевич</div>
                  <div class="project-category text-faded">Volkswagen Polo</div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-sm-6">
            <div class="portfolio-box">
              <img class="img-fluid" src="/images/team/2.JPG" alt />
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-name">Павел</div>
                  <div class="project-category text-faded">Volkswagen Polo</div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-sm-6">
            <div class="portfolio-box">
              <img class="img-fluid" src="/images/team/3.JPG" alt />
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-name">Сергей Валерьевич</div>
                  <div class="project-category text-faded">Volkswagen Polo</div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-sm-6">
            <div class="portfolio-box">
              <img class="img-fluid" src="/images/team/4.JPG" alt />
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-name">Вячеслав</div>
                  <div class="project-category text-faded">Hyundai Solaris</div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-sm-6">
            <div class="portfolio-box">
              <img class="img-fluid" src="/images/team/5.JPG" alt />
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-name">Андрей</div>
                  <div class="project-category text-faded">Peugeot 408</div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-sm-6">
            <div class="portfolio-box">
              <img class="img-fluid" src="/images/team/6.JPG" alt />
              <div class="portfolio-box-caption">
                <div class="portfolio-box-caption-content">
                  <div class="project-name">Виталий</div>
                  <div class="project-category text-faded">Chevrolet Cruze</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="education" class="bg-dark">
      <div class="container text-center">
        <h2 class="section-heading">площадка</h2>
        <br />

        <div class="row justify-content-center">
          <div class="col-md-10 p-0">
            <carousel
              :scroll-per-page="true"
              :per-page="1"
              :per-page-custom="[[480, 1], [768, 2]]"
              :autoplay="false"
              :navigation-enabled="true"
              class="p-0 card"
            >
              <slide>
                <img class="d-block w-100" src="/images/platform/1.JPG" alt="First slide" />
              </slide>

              <slide>
                <img class="d-block w-100" src="/images/platform/2.JPG" alt="Second slide" />
              </slide>

              <slide>
                <img class="d-block w-100" src="/images/platform/3.JPG" alt="Third slide" />
              </slide>

              <slide>
                <img class="d-block w-100" src="/images/platform/4.JPG" alt="Third slide" />
              </slide>

              <slide>
                <img class="d-block w-100" src="/images/platform/5.JPG" alt="Third slide" />
              </slide>
            </carousel>
          </div>
        </div>
      </div>
    </section>
<!-- 
    <section class="bg-light">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h2 class="section-heading">свой блог</h2>
            <br />
            <div class="row justify-content-center">
              <div class="col-md-10">
                <VkArticleWidget />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> -->

    <section id="groups" class="bg-dark">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1 class="section-heading text-center">запись</h1>
            <br />
          </div>
        </div>
        <div class="row justify-content-center">
          <div v-for="group in groups" :key="group.id" class="col-lg-4 col-md-6">
            <GroupCard :key="group.id" :group="group" @select="selectGroup(group.id)" />
          </div>
          <div v-if="groups.length === 0" class="col-md-12 text-center">
              <p>На данный момент запись закрыта.</p>
          </div>
          <!-- <div
            v-for="group in personalTrainingGroups"
            :key="group.id"
            class="col-lg-4 col-md-6"
          >
            <PersonalTrainigCard
              :key="group.id"
              :group="group"
              @select="selectPersonalTrainingGroup(group.id)"
            />
          </div>-->
        </div>
      </div>
    </section>

    <section id="contacts" class="bg-light">
      <div class="container">
        <h1 class="section-heading text-center">контакты</h1>
        <br />
        <div class="card p-0 pb-4">
          <Map :markers="markers" />

          <br />
          <div class="row">
            <div class="col-md-10 mx-auto">
              <br />
              <div class="px-3">
                <p class="h3">Адрес: 1-я Красноармейская ул. 1, Санкт-Петербург.</p>
                <p class="h4 text-muted">Открыто по будням с 10 до 17 часов.</p>
              </div>

              <br />
              <div class="row">
                <div class="col-md-6 text-center mb-4">
                  <i class="fa fa-phone fa-3x sr-contact" />
                  <h4>Олег Владимирович</h4>
                  <h6 class="text-muted">руководитель автошколы</h6>
                  <a href="tel:+79117406422">+7 (911) 740-64-22</a>
                  <br />
                  <p>volovik_ov@bstu.spb.su</p>
                  <hr />
                  <h4>Анатолий Сергеевич</h4>
                  <h6 class="text-muted">зам. руководителя</h6>
                  <a href="tel:+79990282896">+7 (999) 028-28-96</a>
                </div>
                <div class="col-md-6 text-center">
                  <VkGroupsWidget />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <SignupModal />
    <Message />
    <!-- <VkChatWidget /> -->
  </div>
</template>

<script>
// Custom components
import GroupCard from "../components/GroupCard";
// import PersonalTrainingCard from '../components/PersonalTrainingCard';
import SignupModal from "../components/SignupModal";
import Message from "../components/Message";
import Map from "../components/Map/YandexMap";
import VkGroupsWidget from "../components/VkGroupsWidget.vue";
import VkChatWidget from "../components/VkChatWidget.vue";
import VkArticleWidget from "../components/VkArticleWidget.vue";
import GoogleReCaptcha from "~/resources/js/sharedComponents/GoogleReCaptcha";
import { Carousel, Slide } from "vue-carousel";
// Vuex
import { mapState, mapMutations, mapActions } from "vuex";

export default {
  components: {
    GroupCard,
    SignupModal,
    Message,
    Map,
    VkGroupsWidget,
    VkArticleWidget,
    VkChatWidget,
    GoogleReCaptcha,
    Carousel,
    Slide
  },
  data: function() {
    return {
      markers: [{ lat: 59.9163774, lng: 30.3136526 }],
      scrolled: false,
    };
  },
  computed: mapState({
    groups: state => state.group.all
    // personalTrainingGroups: state => state.personalTraining.all,
  }),
  created() {
    this.$store.dispatch("group/getPage", 1);
    // this.$store.dispatch('personalTraining/getPage', 1);
  },
  mounted () {
    window.addEventListener('scroll', this.handleScroll);
  },
  beforeDestroy () {
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
    handleScroll: function() {
      this.scrolled = window.scrollY > 0;
    },
    selectGroup: function(group_id) {
      this.$store.commit("user/setGroup", group_id);
      this.$store.commit("user/showCreateModal");
    }
    // selectPersonalTrainingGroup: function() {},
    // ...mapActions('user', [
    // 	'signUpPersonal',
    // ]),
  }
};
</script>
