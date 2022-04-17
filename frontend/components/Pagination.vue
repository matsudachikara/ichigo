<template>
  <nav class="pagination">
    <a
      :href="`${url}?page=${prev_page()}`"
      class="pagination-previous"
      :class="addCurrentPageClass(prev_page())"
    >
      <div><span class="caret left"></span></div>
    </a>
    <ul class="pagination-list">
      <li v-for="num in paginationArray" :key="num">
        <a
          :href="`${url}?page=${num}`"
          class="pagination-link"
          :class="addCurrentPageClass(num)"
          >{{ num }}
        </a>
      </li>
    </ul>
    <a
      :href="`${url}?page=${next_page()}`"
      class="pagination-next"
      :class="addCurrentPageClass(next_page())"
    >
      <div><span class="caret right"></span></div>
    </a>
  </nav>
</template>

<script>
export default {
  props: {
    current_page: Number,
    total_pages: Number,
    url: String,
  },
  data() {
    return {
      start_page: null,
      end_page: null,
      paginationArray: [],
    }
  },
  watch: {
    '$route.query': '$fetch',
  },
  async fetch() {
    this.calculatePagination()
    this.createPaginationArray()
  },
  methods: {
    calculatePagination() {
      this.start_page = this.current_page < 5 ? 1 : this.current_page - 4
      this.end_page = 8 + this.start_page
      this.end_page =
        this.total_pages < this.end_page ? this.total_pages : this.end_page
      let diff = this.start_page - this.end_page + 8
      this.start_page -= this.start_page - diff > 0 ? diff : 0
    },
    createPaginationArray() {
      this.paginationArray = []
      for (var i = this.start_page; i <= this.end_page; i++) {
        this.paginationArray.push(i)
      }
    },
    addCurrentPageClass(num) {
      if (num == this.current_page) {
        return {
          'is-current': true,
        }
      }
    },
    prev_page() {
      return this.current_page !== this.start_page
        ? this.current_page - 1
        : this.current_page
    },
    next_page() {
      return this.current_page !== this.end_page
        ? this.current_page + 1
        : this.current_page
    },
  },
}
</script>

<style lang="scss">
.pagination {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  &-list {
    display: flex;
    flex-direction: row;
  }
  li {
    width: 35px;
    height: 35px;
    list-style-type: none;
  }
  a {
    border: unset;
    margin: 0;
    &:hover,
    &:focus,
    &:focus-within,
    &:visited,
    &:active {
      background-color: unset;
      color: unset;
    }
  }
  .pagination-link.is-current {
    background-color: unset;
    color: red;
  }
}
.caret {
  width: 0;
  height: 0;
  display: inline-block;
  border: 10px solid transparent;
}
.caret.right {
  border-left-color: black;
}
.caret.left {
  border-right-color: black;
}
</style>
