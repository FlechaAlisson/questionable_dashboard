import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:questionable_dashboard/controller/form.controller.dart';
import 'package:questionable_dashboard/model/answer.model.dart';
import 'package:questionable_dashboard/theme/app_colors.dart';
import 'package:questionable_dashboard/widget/chart.widget.dart';
import 'package:questionable_dashboard/widget/indicator.widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      FormController form = Provider.of<FormController>(context, listen: false);
      form.loadForm();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController page = PageController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Nome da loja'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SideMenu(
            controller: page,
            style: SideMenuStyle(
              openSideMenuWidth: 200,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: AppColors.primary.withOpacity(0.25),
              selectedColor: AppColors.primary.withOpacity(0.85),
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
            ),
            items: _itens(page),
            title: Column(
              children: const [
                Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Versão 1.0.0',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          _list(context, page),
        ],
      ),
    );
  }

  List<SideMenuItem> _itens(PageController page) => <SideMenuItem>[
        SideMenuItem(
          priority: 0,
          title: 'Dashboard',
          onTap: () {
            page.jumpToPage(0);
          },
          icon: const Icon(Icons.pie_chart_sharp),
        ),
        SideMenuItem(
          priority: 1,
          title: 'Sobre',
          onTap: () {
            page.jumpToPage(1);
          },
          icon: const Icon(
            Icons.info,
          ),
        )
      ];

  Widget _list(BuildContext context, PageController page) => Expanded(
        child: PageView(
          controller: page,
          children: [
            _gridCharts(context),
            Container(
              color: Colors.white,
              child: const Center(
                child: Text(
                  'Lorena Epson',
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _gridCharts(BuildContext context) {
    FormController form = Provider.of<FormController>(context);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500, crossAxisSpacing: 30, mainAxisSpacing: 30),
      itemCount: form.forms.length,
      itemBuilder: (context, index) => Column(
        children: [
          Center(
            child: PieChartSample2(
                title: form.forms[index].listQuestion[0].inquiry ?? '',
                values: _getListIndicator(
                    form.forms[index].listQuestion[0].listAnswer)),
          ),
        ],
      ),
    );
  }

  _getListIndicator(List<AnswerModel> listAnswer) {
    List<Indicator> list = [];

    const List<Color> listColor = [
      Color(0xff0293ee),
      Color(0xfff8b250),
      Color(0xff845bef),
      Color(0xff13d38e),
      Color.fromARGB(255, 234, 171, 188),
    ];

    for (var i = 0; i < listAnswer.length - 1; i++) {
      list.add(Indicator(
        color: listColor[i],
        text: listAnswer[i].answer ?? '',
        isSquare: true,
        value: listAnswer[i].percentage ?? 0,
      ));
    }

    return list;
  }
}
