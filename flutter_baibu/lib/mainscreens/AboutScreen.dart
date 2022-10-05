import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff151543),
      body: SingleChildScrollView(
        child: Center(
        child:(Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset('images/birincilogo_3559696.png'),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Hakkında',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Bilgisayar Mühendisliği matematiksel düşünme becerisine dayanan ve geleceğin teknolojisini ve dünyasını imar etmekte çok büyük bir rolü olan, yenilikçiliğe açık, dinamik ve zevkli bir meslektir. İçinde bulunduğumuz "bilgi çağı"nda bilgisayarlar eğlenceden sağlık sistemlerine, savunmadan iletişim sistemlerine, her türlü kişisel servislerden çok büyük kamu sistemlerine kadar her alanda kullanılmaya başlanmıştır. Dünyanın önde gelen büyük gelişmiş ekonomileri, bu üstünlüklerini, bilişim alanında yaptıkları atılımlarla sağlamaktadırlar. Bu alandaki gelişmelerin en önemli öncüleri, hiç kuşkusuz, bilgisayar mühendisleridir. Bunun doğal sonucu olarak, bilgisayar mühendisliği çağımızın en gözde, en çok talep edilen ve katma değeri en yüksek mesleklerinden birisi haline gelmiştir. Uluslararası istatistik kurumlarının verilerine göre, bilgisayar mühendisliği, son on yılda talebin en çok arttığı meslekler sıralamasında ilk sırada gelmektedir. Önümüzdeki 20-30 yıl da bilişim sektöründeki ihtiyacın aratarak devam edeceği öngörülmektedir. Bölümümüz 2015 yılında öğrenci alımına başlamış olup 2019 yılında ilk mezunlarını vermiştir.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )
          ],
        )
        ),
      ),
      )
      );
  }
}
