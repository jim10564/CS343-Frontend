<template>
  <div>
    <table>
      <tr>
        <td>_id</td><td>name</td>
      </tr>
      <tr v-for="item in items" :key="item._id">
        <td>{{item._id}}</td><td>{{item.name}}</td><td><button @click="deleteItem(item._id)">Delete</button></td>
      </tr>
    </table>
    <p></p>
    <input v-model="newItemName">
    <button @click="addItem">Add Item</button>
    <p></p>
    <div v-show="addItemStatus === 'errored'">Could not add item.</div>
    <div v-show="addItemStatus === 'sending'">Adding item. Please wait.</div>
    <div v-show="status === 'errored'">Could not load items.</div>
    <div v-show="status === 'loading'">Loading items. Please wait...</div>
    <div v-show="status === 'loaded' && items.length === 0">No items.</div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'Items',
  data(){
    return {
      items: null,
      status: 'loading', // loaded, errored
      newItemName: '',
      addItemStatus: 'idle', // sending, errored
    }
  }, 
  props: {

  },
  async mounted() {
      try {
          this.getItems();
      }
      catch (error) {
          console.error(error);
      }
  },
  methods: {
    async getItems() {
      try {
          let itemsUrl = "http://localhost:10001/items";
          let response = await axios.get(itemsUrl);
          this.items = response.data;
          this.status = 'loaded';
      } catch (error) {
          console.error(error);
          this.status = 'errored';
      }
    },
    addItem() {
      let newItem = { name: this.newItemName };
      this.newItemName = '';
      this.addItemStatus = 'sending';
      axios.post("http://localhost:10001/items", newItem)
          .then(() => {
              this.addItemStatus = 'idle';
              this.getItems();
          })
          .catch(error => {
              console.error(error);
              this.addItemStatus = 'errored';
          })
    },
    deleteItem(id) {
      axios.delete("http://localhost:10001/items/" + id)
          .then(() => {
              this.addItemStatus = 'idle';
              this.getItems();
          })
          .catch(error => {
              console.error(error);
              this.addItemStatus = 'errored';
          })
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
