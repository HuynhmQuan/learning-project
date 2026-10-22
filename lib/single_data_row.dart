import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test_project_1/all_json.dart';

class SingleDataRow extends StatefulWidget {
  final Map<String, dynamic> singleData;
  final int dataRowIndex;

  const SingleDataRow({
    super.key,
    required this.singleData,
    required this.dataRowIndex,
  });

  @override
  State<SingleDataRow> createState() => _SingleDataRowState();
}

class _SingleDataRowState extends State<SingleDataRow> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSavedData();
  }

  // KOAD DỮ LIỆU KHI MỞ TRANG/APP LÊN
  Future loadSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> cartItems = prefs.getStringList('cart_items') ?? [];

    // LẶP CÁC PHẦN TỬ TRONG dataColors XEM CÓ PHẦN TỬ NÀO GIỐNG VỚI DỮ LIỆU TRONG BIẾN CỤC BỘ KHÔNG?
    setState(() {
      for (var item in dataColors) {
        // Nếu tên sản phẩm này nằm trong danh sách đã lưu -> Đổi trạng thái thành true
        if (cartItems.contains(item['text'])) {
          item['isAdded'] = true;
        }
      }
    });
  }

  void onAddPressed() async {
    // GỌI BIẾN NÀY TRONG BỘ NHỚ CỤC BÔ CỦA MÁY
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> cartItems = prefs.getStringList('cart_items') ?? [];

    // GÁN GIÁ TRỊ CỦA TÊN MÀU CỦA DÒNG HIỆN TẠI
    String currentItemText = widget.singleData['text'];

    // KIỂM TRA XEM TRONG BIẾN CỤC BỘ "cartItems" CÓ TỒN TẠI GIÁ TRỊ TEXT Ở TRÊN CHƯA?
    // NẾU CHƯA THÌ THÊM VÀO
    if (!cartItems.contains(currentItemText)) {
      cartItems.add(currentItemText);
      await prefs.setStringList('cart_items', cartItems);

      setState(() {
        dataColors[widget.dataRowIndex]['isAdded'] =
            !dataColors[widget.dataRowIndex]['isAdded'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 10,
          child: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Color(int.parse(widget.singleData['colorCode'])),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),

        const SizedBox(width: 20.0),

        Expanded(
          flex: 50,
          child: Text(
            widget.singleData['text'],
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Expanded(
          flex: 20,
          child: TextButton(
            onPressed: () {
              onAddPressed();
            },
            child: dataColors[widget.dataRowIndex]['isAdded'] == true
                ? const Icon(
                    Icons.check,
                    size: 25.0,
                  )
                : const Text(
                    'ADD',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
            // : const Icon(
            //     Icons.check_circle,
            //     color: Colors.blue,
            //   ),
          ),
        ),
      ],
    );
  }
}
