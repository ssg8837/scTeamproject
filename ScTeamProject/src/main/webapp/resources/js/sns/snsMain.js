function plusSlides(plusMinus,nowNo)
{
	var count=parseInt($("#count_"+nowNo).val());
	var countNow=parseInt($("#countNow_"+nowNo).val());
	var bgname=".bg_"+nowNo;
	countNow+=plusMinus;
	if(count<countNow)
	{
		countNow-=count;
	}	
	if(countNow<=0)
	{
		countNow+=count;
	}
	$("#countNow_"+nowNo).val(countNow);
	var now="#photo_"+countNow;
	now+="_"+nowNo;
	var fullname=$(now).val();
	var imageUrl='./getImageSns?fullname='+fullname;
	$(bgname).css('background-image', 'url("'+ imageUrl + '")');

}

function showImages(nowNo)
{
	var countNow=parseInt($("#countNow_"+nowNo).val());
	var now="#photo_"+countNow;
	now+="_"+nowNo;
	var fullname=$(now).val();
	var imageUrl='./getImageSns?fullname='+fullname;
	window.open(imageUrl,'이미지 보기');
}