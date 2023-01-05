import 'package:flutter/cupertino.dart';

class GridView extends StatefulWidget {
  const GridView({Key? key}) : super(key: key);

  @override
  State<GridView> createState() => _GridViewState();
}

class _GridViewState extends State<GridView> {
  @override
  Widget build(BuildContext context) {
    Container(
      //width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
        color: AppTheme
            .of(context)
            .secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x3600000F),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image.network(
                      product.image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                    child: Text(
                      product.name,
                      style: AppTheme
                          .of(context)
                          .bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 0),
                    child: Text(
                      '\$${product.price}',
                      style: AppTheme
                          .of(context)
                          .bodyText2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}