// Here are the answers in an array of arrays.
// The outer array is for the quotes, the inner for the answers within that quote.
var answers=[["truth","killed my tree"]
	    ,["equal","honored","profit"]
	    ,["Providence","affection"]
	    ,["gratitude","countrymen"]
            ];

function reportNumberRight(){
    // A simple function to replace the text of the '#report' div
    // with a report on the number that have been answered correctly.

    var numberRight=$('.blank.right').length;
    var numberOfBlanks=$('.blank').length;

    $('#report').text('Correct: '+numberRight+'/'+numberOfBlanks);
    if(numberRight==numberOfBlanks) $('#report').addClass('allCorrect');
}

function checkAnswer(quoteIndex,blankIndex,proposedAnswer){
    // A simple function that takes in which quote we're on (zero indexed)
    // and which blank we're on in that quote (again, zero indexed)
    // and the answer the user has proposed, and returns true for correct,
    // and false for wrong.
    //
    // We'll lowercase both just to make sure we don't mark things wrong
    // due to capitalization.

    return proposedAnswer.toLowerCase()==answers[quoteIndex][blankIndex].toLowerCase();
}

// We use jQuery to set up the drag and drop listeners and so on.
// We do this in javascript since (1) it keeps the HTML cleaner, and (2) if they
// don't have javascript available the drag and drop stuff isn't going to work anyway.
$(function(){
    $(".answer")
        .attr("id",function(i,old){return "answer-"+i}) // give all the answers an id
	.attr("draggable","true") // and set them all to draggable
	.bind("dragstart",function(event){
	    // Squirrel away the answer id when we start dragging so we can access it later
	    event.originalEvent.dataTransfer.setData("text",this.id);
		console.log("hey");
	});
    $(".blank")
        .bind("dragover",function(event){
	    return false; // Apparently also calls preventDefault() on the event, see http://api.jquery.com/bind/
	})
        .bind("dragenter",function(event){
	    return false; // Apparently also calls preventDefault() on the event, see http://api.jquery.com/bind/
	})
        .bind("drop",function(event){
	    // What happens when we drop an answer on a blank...

	    var eventTarget=event.originalEvent.target;
	    var draggedAnswerID=event.originalEvent.dataTransfer.getData("text");
	    var draggedAnswerText=$('#'+draggedAnswerID).text();
	    var quoteIndex=$(eventTarget.parentNode.parentNode).index('.quote');
	    var blankIndex=$(eventTarget).index();

	    $(eventTarget).text(draggedAnswerText); // Set the blank's text to the dragged answer text
	    // Now we'll check if they're right, and set a class on the blank accordingly...
	    if(checkAnswer(quoteIndex,blankIndex,draggedAnswerText)){
		$(event.originalEvent.target).removeClass('wrong').addClass('right');
    		$('#'+draggedAnswerID).remove(); // Get rid of the item from the list (only if it's correct)
	    }else{
			$(eventTarget).text("Wrong Please try again");
		$(event.originalEvent.target).removeClass('right').addClass('wrong');
	    };

	    reportNumberRight();

	    return false; // Apparently also calls preventDefault() on the event, see http://api.jquery.com/bind/
	});
    reportNumberRight(); // Initialize the report area
});
