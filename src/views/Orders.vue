<template>
  <div>
    This will hold the page for managing orders.
  </div>
</template>

<script>
//import axios from 'axios';

export default {
  name: 'Orders',
  data(){
    return {

    }
  }, 
  props: {

  },
  async mounted() {

  },
  methods: {
    
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
table {
  margin-left:auto;
  margin-right:auto;
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
