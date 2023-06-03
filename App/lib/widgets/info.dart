import 'package:flutter/material.dart';

class Melanoma extends StatelessWidget {
  const Melanoma({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.only(top: 190),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 400,
              child: Card(
                color: Colors.brown[300],
                child: InkWell(
                  splashColor: Colors.brown.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MelanomaInfo()),
                    );
                  },
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 400,
                        height: 220,
                        child:Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                             const Text(
                               "Melanoma",
                               style: TextStyle(
                                 fontSize: 50,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black87,
                                 fontFamily: "Roboto",
                               ),
                             ),
                            const Center(
                              child: Text(
                                "Melanoma is the most invasive skin cancer with the highest risk of death. While it’s a serious skin cancer, it's highly curable if caught early.",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontFamily: "Roboto",
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 150),
                              child: const Text("Click for more info",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                  fontFamily: "Roboto",
                                ),
                            ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Symptoms()),
                      );
                    },
                    child: const Text("Symptoms",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  height: 70,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Cause()),
                      );
                    },
                    child: const Text("Causes",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Prevention()),
                      );
                    },
                    child: const Text("Prevention",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),),
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  height: 70,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Treatment()),
                      );
                    },
                    child: const Text("Treatment",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MelanomaInfo extends StatelessWidget {
  const MelanomaInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "What is Melanoma?",
                    style: TextStyle(
                      fontSize: 23,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                const Text(
                  "\n Melanoma, which means \"black tumor\", is the most dangerous type of skin cancer. It grows quickly and has the ability to spread to any organ. Melanoma comes from skin cells called melanocytes. These cells produce melanin, the dark pigment that gives skin its color.About 30% of melanomas begin in existing moles, but the rest start in normal skin. This makes it especially important to pay attention to changes in your skin because the majority of melanomas don't start as moles. However, how many moles you have may help predict your skin’s risk for developing melanoma. Knowing your risk can help you be extra vigilant in watching changes in your skin and seeking skin examinations since melanomas have a 99% cure rate if caught in the earliest stages.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontFamily: "Roboto",
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    "How common is Melanoma?",
                    style: TextStyle(
                      fontSize: 23,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                const Text(
                  "Melanoma accounts for  about 1% of all skin cancers, but causes the great majority of skin cancer-related deaths. It’s one of the most common cancers in young people under 30, especially in young women.\n Melanoma incidence has dramatically increased over the past 30 years. Increasing levels of ultraviolet (UV) exposure are one of the main reasons for this rapid rise in the number of melanoma cases.\n ",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontFamily: "Roboto",
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    "Where can I get Melanoma on my body?",
                    style: TextStyle(
                      fontSize: 23,
                      // fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                const Text(
                  "You can get melanoma on any area of your body. Melanoma can even form on your eyes and internal organs. Men are more prone to develop melanoma on their trunk — often the upper back. Women are more likely to have melanoma on their legs.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontFamily: "Roboto",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Symptoms extends StatelessWidget {
  const Symptoms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Symptoms of Melanoma",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                const Text(
                  "Knowing how to spot Melanoma is important because early melanomas are highly treatable. Melanoma can appear as moles, scaly patches, open sores or raised bumps.\n Use the American Academy of Dermatology's \"ABCDE\" memory device to learn the warning signs that a spot on your skin may be melanoma:\n 1. Asymmetry: One half does not match the other half.\n 2. Border: The edges are not smooth.\n 3. Color: The color is mottled and uneven, with shades of brown, black, gray, red or white.\n 4. Diameter: The spot is greater than the tip of a pencil eraser (6.0 mm).\n 5. Evolving: The spot is new or changing in size, shape or color.\n ome melanomas don't fit the ABCDE rule, so tell your doctor about any sores that won't go away, unusual bumps or rashes or changes in your skin or in any existing moles.\n \n Another tool to recognize melanoma is the ugly duckling sign. If one of your moles looks different from the others, it’s the ugly duckling and should be seen by a dermatologist.\n\n Melanomas can develop anywhere on your body. They most often develop in areas that have had exposure to the sun, such as your back, legs, arms and face.\n\n Melanomas can also occur in areas that don't receive much sun exposure, such as the soles of your feet, palms of your hands and fingernail beds. These hidden melanomas are more common in people with darker skin.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontFamily: "Roboto",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Cause extends StatelessWidget {
  const Cause({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Causes of Melanoma",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                const Text(
                  "Normally, healthy new skin cells nudge older skin cells toward the surface, where they die. DNA damage within the melanocytes can cause new skin cells to grow out of control. As the skin cells build up, they form a tumor.\n\n It’s not entirely clear why DNA in skin cells gets damaged. It may be a combination of genetic and environmental factors.The leading cause may be exposure to ultraviolet (UV) radiation. UV radiation can come from such sources as natural sunlight, tanning beds, and tanning lamps.\n\n Although anyone can develop melanoma, an increased risk for developing the disease is seen in people with:\n 1. A personal history of melanoma.\n 2. A family history of melanoma.\n 3. Fair skin, freckles, blond or red hair and blue eyes.\n 4. Excess sun exposure, including blistering sunburns.\n 5. An address near the equator or in high elevations — living in these locations may increase your UV exposure.\n 6. A history of tanning bed use.\n 7. Many moles, especially atypical moles.\n 8. A weakened immune system.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontFamily: "Roboto",
                  ),
                ),
              ],
            ),
          ],      ),
      ),
    );
  }
}

class Prevention extends StatelessWidget {
  const Prevention({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Prevention of Melanoma",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                const Text(
                  "While you can’t completely eliminate risk, here are a few ways to help prevent melanoma and other skin cancers from developing: \n 1. Avoid exposing your skin to the midday sun whenever possible. Remember, the sun still affects your skin on cloudy days and in winter.\n 2. Use sunscreen. Use a broad-spectrum sunscreen with an SPF of at least 30. Reapply every 2 hours or more often if you perspire a lot or go in the water. Do this regardless of the season.\n 3. Cover up. When spending time outdoors, keep your arms and legs covered. Wear a broad-brimmed hat to protect your head, ears, and face. \n 4. Wear sunglasses that protect from UVA and UVB rays. \n 5. Don’t use tanning beds or tanning lamps.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontFamily: "Roboto",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Treatment extends StatelessWidget {
  const Treatment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/home.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Treatment for Melanoma",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
                const Text(
                  "1. Melanoma Surgery: In the early stages, surgery has a high probability of being able to cure your melanoma. Usually performed in an office, a dermatologist numbs the skin with a local anesthetic and removes the melanoma and margins (healthy surrounding skin).\n 2. Lymphadenectomy: In cases where melanoma has spread, removal of the lymph nodes near the primary diagnosis site may be required. This can prevent the spread to other areas of your body.\n 3. Metastasectomy: Metastasectomy is used to remove small melanoma bits from organs.\n 4. Targeted cancer therapy: In this treatment option, drugs are used to attack specific cancer cells. This “targeted” approach goes after cancer cells, leaving healthy cells untouched.\n 5. Radiation Therapy: Radiation therapy includes treatments with high-energy rays to attack cancer cells and shrink tumors.\n 6. Immunotherapy: Immunotherapy stimulates your own immune system to help fight the cancer.\n 7. Some patients with skin cancer may participate in a clinical trial. A clinical trial is a research program conducted with patients to evaluate a medical treatment,drug or device.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontFamily: "Roboto",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
