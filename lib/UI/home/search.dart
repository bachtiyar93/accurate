import 'package:cpssoft/UI/home/bloc/home_controller.dart';
import 'package:cpssoft/model/mcity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatefulWidget {
  const Search({super.key, required this.citys});
  final List<City> citys;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  bool filtered=false;
  String? selectedSort;
  String? _selectedCity;
  List<String> datacity=['No Filter'];
  @override
  void initState() {
    datacity.addAll(widget.citys.map((e) => e.name!).toList());
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(child: Container()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Flexible(
                flex: 1,
                child: Text('Users', style: Theme.of(context).textTheme.titleLarge,)),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10,right: 5),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Cari',
                    hintStyle: const TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.only(left: 30,),
                    suffixIcon: MaterialButton(
                      onPressed: (){
                        if(filtered ){
                          searchController.clear();
                          setState(() {
                            filtered=false;
                            _selectedCity=datacity.first;
                            selectedSort='No Filter';
                          });
                          context
                              .read<HomeBloc>()
                              .add(CleanFilter());
                        }else
                        {
                          setState(() {
                            filtered=true;
                          });
                          context
                              .read<HomeBloc>()
                              .add(SearchUser(searchController.text));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 3.0, left: 5.0),
                        child: Icon(
                          filtered?Icons.close:Icons.search,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: DropdownButton<String>(
                hint: const Text('Sort'),
                value: selectedSort,
                items: ['No Filter','A-Z', 'Z-A'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedSort = newValue;
                  });
                  context
                      .read<HomeBloc>()
                      .add(SortUser(newValue!));
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: DropdownButton<String>(
                hint: const Text('City'),
                value: _selectedCity,
                items: datacity.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedCity = newValue;
                  });
                  context
                      .read<HomeBloc>()
                      .add(FilterCity(newValue!));
                },
              ),
            ),
            const SizedBox(width: 10),
            IconButton(onPressed:(){} ,icon: const Icon(Icons.person_add),)
          ],
        )
      ],
    );
  }
}