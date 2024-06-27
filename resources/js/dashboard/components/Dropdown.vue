<template>
  <div class="dropdown">
    <button
      id="dropdownMenuButton"
      class="btn btn-secondary dropdown-toggle"
      type="button"
      data-toggle="dropdown"
      aria-haspopup="true"
      aria-expanded="false">
      Dropdown button
    </button>
    <div
      class="dropdown-menu"
      aria-labelledby="dropdownMenuButton">
      <a
        class="dropdown-item"
        href="#">Action</a>
      <a
        class="dropdown-item"
        href="#">Another action</a>
      <a
        class="dropdown-item"
        href="#">Something else here</a>
    </div>
  </div>
</template>
<script>
export default {
	props: {
		items: {
			type: Array,
			default: () => [],
		}
	}
};
</script>
