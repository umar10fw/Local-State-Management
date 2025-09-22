import 'package:flutter/material.dart';

class FilterModel extends InheritedModel<String> {
  final String priceFilter;
  final String brandFilter;

  const FilterModel({
    required this.priceFilter,
    required this.brandFilter,
    required Widget child,
  }) : super(child: child);

  static FilterModel? of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<FilterModel>(context, aspect: aspect);
  }

  @override
  bool updateShouldNotify(FilterModel oldWidget) {
    return priceFilter != oldWidget.priceFilter ||
        brandFilter != oldWidget.brandFilter;
  }

  @override
  bool updateShouldNotifyDependent(FilterModel oldWidget, Set<String> aspects) {
    if (aspects.contains("price") && priceFilter != oldWidget.priceFilter) {
      return true;
    }
    if (aspects.contains("brand") && brandFilter != oldWidget.brandFilter) {
      return true;
    }
    return false;
  }
}

class EcommercePage extends StatefulWidget {
  @override
  _EcommercePageState createState() => _EcommercePageState();
}

class _EcommercePageState extends State<EcommercePage> {
  String price = "Low";
  String brand = "Nike";

  @override
  Widget build(BuildContext context) {
    return FilterModel(
      priceFilter: price,
      brandFilter: brand,
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                final model = FilterModel.of(context, "price");
                return Text("Price Filter: ${model?.priceFilter}");
              }),
              SizedBox(
                height: 10,
              ),
              Builder(builder: (context) {
                final model = FilterModel.of(context, "brand");
                return Text("Brand Filter: ${model?.brandFilter}");
              }),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    price = price == "Low" ? "High" : "Low";
                  });
                },
                child: const Text("Toggle Price"),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    brand = brand == "Nike" ? "Adidas" : "Nike";
                  });
                },
                child: const Text("Toggle Brand"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
