let cat = document.getElementsByName("cat");
if (cat.length > 0) {
    let vlr = document.getElementsByName("vlr");
    let labelsX = [];
    let dataX = [];
    let colorX = [];
    if (vlr[1].value > 0) {
        for (var i = 0; i < cat.length; i++) {
            labelsX[i] = cat[i].value;
            dataX[i] = vlr[i].value;
        }
        colorsX = ['#36CAAB', '#49A9EA', '#FFD700', '#FF69B4', '#64E572', '#FF9655', '#FFFF00', '#AC5353',
                   '#4B0082', '#D8BFD8', '#2E8B57', '#BDB76B', '#6B8E23', '#7B68EE', '#EE82EE', '#CFD4D8'];
    } else {
        labelsX[1] = cat[0].value;
        dataX[1] = vlr[0].value;
        labelsX[0] = cat[1].value;
        dataX[0] = vlr[1].value;
        colorsX = ['#FF6347', '#36CAAB', '#49A9EA', '#FFD700', '#FF69B4', '#64E572', '#FF9655', '#FFFF00', 
                   '#AC5353', '#4B0082', '#D8BFD8', '#2E8B57', '#BDB76B', '#6B8E23', '#7B68EE', '#EE82EE', '#CFD4D8'];
    }

    let myChart3 = document.getElementById("myChart3").getContext('2d');

    let chart3 = new Chart(myChart3, {
        type: 'doughnut',
        data: {
            labels: labelsX,
            datasets: [{
                    data: dataX,
                    backgroundColor: colorsX
                }]
        },
        options: {
            title: {
                text: "Resumo Financeiro",
                display: true,
		fontSize: 20
            }
        }
    });
}
