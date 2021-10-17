import 'package:fixyourprint/models/AlternativesDataModel.dart';

class AlternativesData {
  List<AlternativesDataModel> getAlternatives() {
    var alternatives = <AlternativesDataModel>[];

    var param1 = AlternativesDataModel(
        data:
            "1. Carpool-Although this might require more time and planning, it can save large amounts of gasoline, especially for long trips \n2. Drive an Electric Vehicle- If you do own a car, electric vehicles are a cleaner and greener option than gasoline-powered cars. \n3. Use Fuel-Efficient Vehicles- If you are unable to go electric or even car-free, you can opt for a fuel efficient car which will help the cause even if it is by a small bit",
        imgUrl:
            "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2020/06/11/Pictures/delhi-coronavirus-lockdown-day-70_53ab8746-abcd-11ea-8237-3f05c44deb25.jpg",
        parameter: "Transport");
    alternatives.add(param1);

    var param2 = AlternativesDataModel(
        data:
            "1. Cover Open vessel by lid as far as possible.\n2.Before lighting stove prepare and keep all the material ready and within reach.\n3. Use pressure vessels wherever possible.",
        imgUrl:
            "https://cdn.risingbd.com/media/imgAll/2021March/en/LPG-2104120808.jpg",
        parameter: "Lpg");
    alternatives.add(param2);

    var param3 = AlternativesDataModel(
        data:
            "1. Using a cleaner source of energy to power your homes like solar energy. \n2. Using energy efficient appliances can reduce the consumption of Electricity .\n3. Using LED lights instead of conventional bulbs",
        imgUrl:
            "https://p1.pxfuel.com/preview/116/686/402/glow-scenic-landscape-high-voltage-lines-sky-sunset-travel.jpg",
        parameter: "Electricity");
    alternatives.add(param3);

    var param4 = AlternativesDataModel(
        data:
            "1. Do Away With Plastic- Reducing the use of plastic as much as possible like plastic straws, polythene bags, plastic cups etc and use alternatives like metal straws, cloth bags and glasses. \n2. Segregating waste-Segregation of waste can reduce the garbage burden on the already overflowing landfills, thereby curbing the carbon levels.\n3. A simple way of contributing to curb the rising Carbon levels and making a small difference towards waste disposal is to adopt the 3 R's - Reduce, Reuse and Recycle",
        imgUrl:
            "https://images.unsplash.com/photo-1562077981-4d7eafd44932?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d2FzdGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80",
        parameter: "Waste");
    alternatives.add(param4);

    var param5 = AlternativesDataModel(
        data:
            "1. Cutting down the meat consumption even by a bit can help reduce your carbon footprint.\n2. Avoid plastic packaging- as this indirectly contributes to the Carbon levels.\n3. Eating organic- Organic/Local produced food in addition to having health benefits, have a much smaller carbon footprint",
        imgUrl:
            "https://images.squarespace-cdn.com/content/v1/5c5c3833840b161566b02a76/1573133725500-Y5PCN0V04I86HDAT8AT0/WBC_7095.jpg?format=2500w",
        parameter: "Food");
    alternatives.add(param5);

    return alternatives;
  }
}
