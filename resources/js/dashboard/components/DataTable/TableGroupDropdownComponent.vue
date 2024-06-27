<template>
  <div class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
    Фильтровать по группе <span class="badge">387</span>
    <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
      <li><a class="filter-item" href="#" data-id="54">Вечернее обучение (Пн, Ср)</a></li>
      <li><a class="filter-item" href="#" data-id="53">Группа воскресного обучения</a></li>
      <li><a class="filter-item" href="#" data-id="52">переподготовка с В на С</a></li>
      <li><a class="filter-item" href="#" data-id="51">вечернее обучение (Пт)</a></li>
      <li><a class="filter-item" href="#" data-id="50">группа выходного дня (Сб)</a></li>
      <li><a class="filter-item" href="#" data-id="49">вечернее обучение (Вт, Чт)</a></li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'TableGroupDropdownComponent',
}
</script>