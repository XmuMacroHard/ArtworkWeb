/**
 * 
 */

function acceptOrder()
{
	window.location.href="setCustomizationPaymentAction";
}

function rejectOrder()
{
}

function installment(times)
{
	var list = "";
	var $installmentTable = $("#installment");
	
	for(var i = 0; i < times; i++)
	{		
		list += "<tr class='first odd'>" +
        "<td class='a-right'><input name='moneys' class='form-control' placeholder='金额'></input></td>" +
        "<td class='a-right'><input name='dates' class='form-control' type='date'/>" +
        "</td>" +
      "</tr>";
	}
	
	$installmentTable.empty();
	$installmentTable.append(list);
}