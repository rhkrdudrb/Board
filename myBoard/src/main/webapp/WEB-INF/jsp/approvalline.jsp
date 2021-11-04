<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://cdn.jsdelivr.net/npm/vue@2.5.13/dist/vue.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="app"> {{ message }} </div> 
<ul id="demo"> {{ message }}</ul>
<script>
var app = new Vue
({ el: '#app', 
	data: { message: 'Hello Vue!' } }) 
	
var treeData = {
	  name: 'My Tree',
	  children: [
	    { name: 'hello' },
	    { name: 'wat' },
	    {
	      name: 'child folder',
	      children: [
	        {
	          name: 'child folder',
	          children: [
	            { name: 'hello' },
	            { name: 'wat' }
	          ]
	        },
	        { name: 'hello' },
	        { name: 'wat' },
	        {
	          name: 'child folder',
	          children: [
	            { name: 'hello' },
	            { name: 'wat' }
	          ]
	        }
	      ]
	    }
	  ]
	}		
	
	
var demo = new Vue({
	  el: '#demo',
	  data: {
		  message: treeData
	  },
	  methods: {
	  	makeFolder: function (item) {
	    	Vue.set(item, 'children', [])
	      this.addItem(item)
	    },
	    addItem: function (item) {
	    	item.children.push({
	        name: 'new stuff'
	      })
	    }
	  }
	})	

	
</script>

</body>
</html>