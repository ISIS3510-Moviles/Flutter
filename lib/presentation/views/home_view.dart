import 'package:campus_bites/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const images = [
      'https://s3-alpha-sig.figma.com/img/1995/2cd0/36213709e2a517588988536a59ae29e7?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=sGdTF5yLsmBK0i1QEbiaalrN1gf5i113PSGzcrqRpZPDGKdUuDoFZjdTLkqtrVGWk-pbCyOP~Qieln3UfgEbMXr8QceLSg47H95-8IjCLLenKJDvG8JrFJgxhgjxEDpyxEVmnD5LKgBlV-ZDsnSv7gGkoWngnelbgzhG919lHmQK28KqbJ~ZraxbPzyek2VY6pkitI5Tf-U-hAer5rY4YjggrUic9rDaWbiDk2z9xnx3~Gy0YjF5kfswTA1Z8tsULHdDekVuLfb0l5JQfwWi52-A5QPVlvoKKzcqJ4YxzdHdNapRuEyCaIpyPY2W68uvj5jbUkupOtwubp4oWifIrg__',
      'https://s3-alpha-sig.figma.com/img/9316/a05b/72c94cd65165d22d9e4a454d8097daf2?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=EVlE6Z2Ni0~lTOT0PhFK6~v6MWPopFaDz3zRdgaJM5stz8SF1a1Yc2h2pIQ78D9kO8UyzGa~ew07AD8-iMFQ69s7nyiL7ZhdiUaPhCzQjHCuZU7fgEzCEldcIZGoRXe706x1rEqzoWYbLDqJU7PZ29rJ-OHGcGElwSk~~yUAb5alZIqTn~FPeS0wl90ojhr8sPxS-IE9UuwOVpQGNaNTgW~O~m90ma~nvCtNs6e8vqpSZOdEaTQk113jCkUJmTD~lkGDpYym3gDaKfb0MgZ-qVqEkJGbg7SEnUv1Sf6aPP9GV7bKbZtWZRWF9mpCUQewc9yqGaNsEpe7m9-It9um5g__',
      'https://s3-alpha-sig.figma.com/img/9c64/2538/ae0a2f492bf2fb4b720c92ab27bba7e9?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=JO1MKtGTdjLEturNsIIBVDh8Mavu0GzcRpxXSPtm~exbqHTJPJrL0o24oc1h6AwtPP6K4Cr~-0WjNlZlWqRsvLqGJw7L2hLkiQeSO2Z1I9MrcweGoWRFiSc5L0OT2qDkZSXZY5DL5T4RP-KwaYb4J~lcnOCOhla9z1pq2Bw0u76uoCUOrj-eVsPTGx3C2lOzqTr8ES3uRD12kQl69~9taD52aclzwTNUl9HVsA3n9ySVpHvtzptY7zn7oJlAVg4L5aeLvFOAu8T67daNjIsV3p3rmBWS2GLFZLWojA7uuzI57ikzz2YzY6wJ5dAj5dJs7cWNSLLCeQUuWv8~tgZ5yA__',
      'https://s3-alpha-sig.figma.com/img/f3a8/35e6/a63019cb0d331911c0e74e573cdd9700?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=LOvXOCI7h0RZ-ZE-vEWXBspp9w1pRVWZnVjEn4Yb8WBvKOa-fnmIx4d6ttlgJEhDXektz9O18fcWcshivs~9j0bfSEw3qoRUz5-4s0iB-bf5CHW0siD5P2E4za5XOyNoGIZ2ZQlIvMSCw0Bwmve8615tYJCOMZdJNHbr0G8XnPZO4fyrqCSJ8xa0xkZZrV5ArJpUeQiQLhQ~U~GY9RYPHMfLw3jOvQAbNgJbm8h8e-XzClVTv42oH4rHfzPNRDGaOS8ZHAofBYE4f7Rv-d4BalCfWffeXEWhB3s06SSxGNw3UXKMPo~rhRgoXiiadCFqDeyifnuPAA3CjzTacznaTA__'
    ];
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
          backgroundColor: Color(0xFFF9A825),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 314,
                child: CustomTextFormField(label: 'Search food',)
              )
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 314,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 70,
                      height: 70,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF9A825),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.network(
                              images[index%4],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),

        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  SizedBox(
                  width: 314,
                  child: Column(
                    children: [
                      _Title(title: 'Restaurants', subTitle: 'Near to you'),
                      
                      _CustomCard(title: 'Starbucks (Andes)', rating: '3.0', distance: '200 meters', imageUrl: 'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',),
                      _CustomCard(title: 'Starbucks (Andes)', rating: '3.0', distance: '200 meters', imageUrl: 'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',),
                      _CustomCard(title: 'Starbucks (Andes)', rating: '3.0', distance: '200 meters', imageUrl: 'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',),
                      _CustomCard(title: 'Starbucks (Andes)', rating: '3.0', distance: '200 meters', imageUrl: 'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',)
                    ],
                  ),
                ),
              
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
          childCount: 1
        )
        )
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({
    this.title,
    this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(title!, style: titleStyle),
          
          const Spacer(),
        
          if (subTitle != null)
            FilledButton.tonal(
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                backgroundColor: WidgetStatePropertyAll(Color(0xFFF46417)),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () {},
              child: Text(subTitle!, style: TextStyle(color: Colors.white),),
            )
        ],
      )
    );
  }
}

class _CustomCard extends StatelessWidget {
  final String title;
  final String rating;
  final String distance;
  final String imageUrl;

  const _CustomCard({required this.title, required this.rating, required this.distance, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star_border_outlined, size: 18, color: Color(0xFFF9A825)),
                      SizedBox(width: 4),
                      Text(rating),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.directions_walk, size: 18),
                      SizedBox(width: 4),
                      Text(distance),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      _buildTag('Dinner'),
                      SizedBox(width: 8),
                      _buildTag('Breakfast'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xFFF9A825),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
