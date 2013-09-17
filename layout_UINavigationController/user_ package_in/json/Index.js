function testAlert(){

    var aTitle = "警告标题";
    var aMsg = "警告内容。";

    var cancelButtonItem = function(title){

    }

    var otherButtonItem_1 = function(title){

    }

    var otherButtonItem_2 = function(title){

    }

    alertWith(aTitle, aMsg, cancelButtonItem, otherButtonItem_1, otherButtonItem_2);


}


function testPush() {
    pushTo("newPage/NewPage.json");
}