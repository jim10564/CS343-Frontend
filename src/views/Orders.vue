<template>
  <div>
    <table>
      <tr>
        <td>_id</td><td>email</td>
      </tr>
      <tr v-for="order in orders" :key="order._id">
        <td>{{order._id}}</td><td>{{order.email}}</td><td><button @click="viewOrder(order._id)">Order Details</button></td>
      </tr>
    </table>
  </div>
  <p></p>
<div v-if="order !== null">
    <table>
      <tr>
        <td>_id</td><td>{{order._id}}</td>
      </tr>
      <tr>
        <td>email</td><td>{{order.email}}</td>
      </tr>
      <tr>
        <td>preferences</td><td>{{order.preferences}}</td>
      </tr>
      <tr>
        <td>restrictions</td><td>{{order.restrictions}}</td>
      </tr>
      <tr>
      <td>Items:</td>
      <td>
      <tr v-for="item in order.items" :key="item._id">
        <td>{{item._id}}</td><td>{{item.name}}</td>
      </tr>
      </td>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Orders',
  data(){
    return {
      orders: [],
      order: null,
    }
  }, 
  props: {

  },
  async mounted () {
    try {
        this.getOrders();
    }
    catch (error) {
        console.error(error);
    }
  },
  watch: {
    // call again the method if the route changes
    '$route': 'getOrders'
  },
  methods: {
    async getOrders() {
      try {
        let ordersUrl = "http://localhost:10001/orders";
        console.log(ordersUrl);
        let response = await axios.get(ordersUrl);
        console.log(response);
        this.orders = response.data;
        console.log(this.orders);
        this.status = 'loaded';
      } catch (error) {
        console.error(error);
        this.status = 'errored';  
      }
    },
    async viewOrder(id) {
      console.log(id);
      try {
        let ordersUrl = "http://localhost:10001/orders/" + id;
        console.log(ordersUrl);
        let response = await axios.get(ordersUrl);
        this.order = response.data;
        console.log(this.order);
        this.status = 'loaded';
      } catch (error) {
        console.error(error);
        this.status = 'errored';  
      }
    }
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
