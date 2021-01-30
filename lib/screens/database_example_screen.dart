import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/components/Utils.dart';
import 'package:flutter_example/database/database.dart';
import 'package:flutter_example/database/models/CategoryWithProductCount.dart';
import 'package:provider/provider.dart';

class DatabaseExampleScreen extends StatefulWidget {
  @override
  _DatabaseExampleScreenState createState() => _DatabaseExampleScreenState();
}

class _DatabaseExampleScreenState extends State<DatabaseExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
        centerTitle: true,
      ),
      body: buildCategoryList(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Utils.showInputDialog(
            context,
            lableText: 'Category name',
            hintText: 'Enter category name',
            title: Center(child: Text('Create Category')),
          ).then((value) {
            if (value != null) {
              final db = context.read<Database>();
              db
                  .insertCategory(
                Category(
                  categoryId: null,
                  categoryName: value,
                ),
              )
                  .then((value) {
                if (value != null) {
                  BotToast.showText(
                    text: "Successuly inserted",
                    textStyle: TextStyle(color: Colors.greenAccent),
                    onlyOne: true,
                    duration: Duration(seconds: 1),
                  );
                }
              });
            }
          });
        },
      ),
    );
  }

  Widget buildCategoryList(BuildContext context) {
    final db = context.watch<Database>();
    final theme = Theme.of(context);
    return StreamBuilder(
      stream: db.watchAllCategoryWithProductCount(),
      builder: (context, snapshot) {
        List<CategoryWithProductCount> dataList = snapshot.data ?? List();
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : dataList.isEmpty
                ? Center(
                    child: Text('No data'),
                  )
                : ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      final data = dataList[index];
                      return ListTile(
                        title: Text(data.category.categoryName),
                        trailing: Text(
                          data.productCount.toString(),
                          style: TextStyle(
                            color: theme.accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        onTap: () {},
                        onLongPress: () {},
                      );
                    },
                  );
      },
    );
  }
}
