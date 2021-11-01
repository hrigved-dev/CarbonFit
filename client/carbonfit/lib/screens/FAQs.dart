import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FAQ extends StatelessWidget {
  List<String> questions = [
    "1) What exactly is my carbon footprint?",
    "2) Why do I need to measure my carbon footprint?",
    "3) How can I possibly calculate my carbon footprint?",
    "4) What is the carbon offset?",
    "5) What other related terms are used for the reduction of CO2 emissions?",
    "6) Is the measurement of the carbon footprint compulsory?",
    "7) What is carbon emisson?",
    "8) Which factors are responsible for the carbon emission of a single person?",
  ];
  List<String> answers = [
    "Your carbon footprint is the climate change impact of your activities. We live in a carbon-based world where all of our consumption, production and transportation — almost everything we do — result in some carbon emissions.",
    "Measuring carbon footprint could be a great starting point for those who care about their impact on the environment. It is important to understand where your carbon emissions come from as there may be a lot of surprises.",
    "There are various calculators that will give you an estimate of your carbon footprint based on the size of your household, the efficiency of your appliances, how much you drive or fly, what you eat, and how much you recycle.",
    "The carbon offset is a financial instrument that enables companies and countries to reduce their carbon emissions, or example by using renewable energy resources.",
    "The relevant literature uses several other terms related to the reduction of CO2 emissions and climate protection, such as zero carbon emission, products/services and organisations with low carbon emissions, low carbon economy, carbon neutral activity, carbon trade, roadmap of carbon emission reduction, green public procurement, green strategies and so on.",
    "No. But a lot of companies, mainly multinational companies, are interested in assessing their CF. Examples can also be found in the Government sector. For companies, one of the reasons is that they can use it as a marketing tool, on the labels of their products. They are also interested in communicating their CF through their CSR reports.",
    "Carbon emissions, measured in CO2e, is a unit that measures the carbon dioxide equivalent that may be released from the chosen human activity.",
    "The primary factors responsible for the carbon emission of a single person are Transport, LPG, Food, Waste, Electricity.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FAQs',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato'),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 670,
                child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              questions[index],
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 17),
                            ),
                            Text(
                              "➜" + answers[index],
                              style:
                                  TextStyle(fontFamily: 'Lato', fontSize: 17),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
