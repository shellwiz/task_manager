function saveTask(id) {
  var taskHeader = "taskHeader" + id;
  var taskText = "taskText" + id;

  var head = document.getElementById(taskHeader).value;
  var txt = document.getElementById(taskText).value;

  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      alert(this.responseText);
    }
  }

  xhttp.open("POST", "save_task", true);
  xhttp.setRequestHeader("Content-type", "text/plain");
  xhttp.send(id + "\n" + head + "\n" + txt + "\n");

}

function createViewTask(id) {
    if (document.getElementById('listTask') == null) {
        createViewTaskRender(id) 
    }
    else {
        createViewTaskNoRender(id)
    }
}

function createViewTaskRender(id) {
    var listTask = document.getElementById('listTaskRender')

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        listTask.innerHTML += this.responseText
      }
    }

    xhttp.open("POST", "get_task_render", true);
    xhttp.setRequestHeader("Content-type", "text/plain");
    xhttp.send(id + "\n");
}

function createViewTaskNoRender(id) {
    var listTask = document.getElementById('listTask')
    
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        listTask.innerHTML += this.responseText
      }
    }

    xhttp.open("POST", "get_task", true);
    xhttp.setRequestHeader("Content-type", "text/plain");
    xhttp.send(id + "\n");
}

function addTask() {
  var taskHeader = "taskHeadernew";
  var taskText = "taskTextnew";
  var taskOwner = "taskOwnernew"

  var head = document.getElementById(taskHeader).value;
  var txt = document.getElementById(taskText).value;
  var owner = document.getElementById(taskOwner).value;

  document.getElementById(taskHeader).value = "";
  document.getElementById(taskText).value = "";
  document.getElementById(taskOwner).value = "";


  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      createViewTask(this.responseText.replace(/[^0-9]/g, ""));

      showDescription('new')
    }
  }

  xhttp.open("POST", "add_task", true);
  xhttp.setRequestHeader("Content-type", "text/plain");
  xhttp.send(owner + "\n" + head + "\n" + txt + "\n");
}

function closeTask(id) {
  var rowid = "row" + id
  var body = "body" + id;

  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById(rowid).innerHTML = ""
      document.getElementById(body).innerHTML = ""
      alert(this.responseText);
    }
  }


  xhttp.open("POST", "delete_task", true);
  xhttp.setRequestHeader("Content-type", "text/plain");
  xhttp.send(id + "\n");
}


function showDescription(id) {
  var rowid = "row" + id;
  var descr = "descr" + id;

  var curDescr = document.getElementById(descr);
  var curClass = curDescr.getAttribute("class");

  if (curClass.search("hidden") == -1)
    var newClass = curClass + "hidden";
  else
    var newClass = curClass.replace("hidden", "");

  curDescr.setAttribute("class", newClass)
}
