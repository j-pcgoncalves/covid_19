import 'package:covid_19/constants.dart';
import 'package:covid_19/widgets/my_header.dart';
import 'package:covid_19/widgets/prevent_card.dart';
import 'package:covid_19/widgets/symptom_card.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final controller = ScrollController();
  double offset = 0;

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: 'assets/icons/coronadr.svg',
              textTop: 'Get to know',
              textBottom: 'About Covid-19.',
              offset: offset,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Symptoms',
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        SymptomCard(
                          image: 'assets/images/headache.png',
                          title: 'Headache',
                          isActive: true,
                        ),
                        SizedBox(width: 15),
                        SymptomCard(
                          image: 'assets/images/caugh.png',
                          title: 'Cough',
                        ),
                        SizedBox(width: 15),
                        SymptomCard(
                          image: 'assets/images/fever.png',
                          title: 'Fever',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Prevention', style: kTitleTextStyle),
                  const SizedBox(height: 20),
                  const PreventCard(
                    text:
                        'Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks',
                    image: 'assets/images/wear_mask.png',
                    title: 'Wear face mask',
                  ),
                  const PreventCard(
                    text:
                        'Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks',
                    image: 'assets/images/wash_hands.png',
                    title: 'Wash your hands',
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
