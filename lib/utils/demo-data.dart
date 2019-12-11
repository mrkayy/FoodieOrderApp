
import '../widgets/activity-card.dart';
import '../widgets/customerInfoCard.dart';
import '../widgets/orderOverview-card.dart';

class Demodata {

  static List<CustomerInfoCard> customerInfo = [
    CustomerInfoCard(
      name: "Michael",
      phone: "08074927376",
      orderCount: "13",
    ),
    CustomerInfoCard(
      name: "Michael",
      phone: "08074927376",
      orderCount: "13",
    ),
    CustomerInfoCard(
      name: "Michael",
      phone: "08074927376",
      orderCount: "13",
    ),
    CustomerInfoCard(
      name: "Michael",
      phone: "08074927376",
      orderCount: "13",
    ),
    CustomerInfoCard(
      name: "Michael",
      phone: "08074927376",
      orderCount: "13",
    ),
    CustomerInfoCard(
      name: "Michael",
      phone: "08074927376",
      orderCount: "13",
    ),
    CustomerInfoCard(
      name: "Michael",
      phone: "08074927376",
      orderCount: "13",
    ),
    CustomerInfoCard(
      name: "Michael",
      phone: "08074927376",
      orderCount: "13",
    ),
    CustomerInfoCard(
      name: "Michael",
      phone: "08074927376",
      orderCount: "13",
    ),
  ];

  static List<ActivityOverview> activities = [
    ActivityOverview(
      entryTitle: "Orders",
      completedEntry: 70,
      totalEntry: 109,
    ),
    ActivityOverview(
      entryTitle:"Contacts",
      completedEntry:9,
      totalEntry:12,
    ),
    ActivityOverview(
      entryTitle:"Failed",
      completedEntry:5,
      totalEntry:8,
    ),
    ActivityOverview(
      entryTitle:"Completed",
      completedEntry:6,
      totalEntry:19,
    ),
    ActivityOverview(
      entryTitle:"Saved",
      completedEntry:6,
      totalEntry:10,
    ),
  ];

  static List<OrderOverView> orderOverview = [
    OrderOverView(
      timeStamp: "null",
      status: "Processed",
      customerName: "Femi",
      itemCount: "5",
      customerPhone: "08090839255",
      orderAmount: "650.00",
      vendorName: "Mama Calabar",
      orderType: "paid",
    ),
    OrderOverView(
      timeStamp: "null",
      status: "Completed",
      customerName: "Seyi",
      itemCount: "3",
      customerPhone: "08090839255",
      orderAmount: "950.00",
      vendorName: "Mama Calabar",
      orderType: "paid",
    ),
    OrderOverView(
      timeStamp: "null",
      status: "Pending",
      customerName: "Olaolu",
      itemCount: "7",
      customerPhone: "08090839255",
      orderAmount: "450.00",
      vendorName: "Mama Calabar",
      orderType: "unpaid",
    ),
    OrderOverView(
      timeStamp: "null",
      status: "Cancelled",
      customerName: "Fave",
      itemCount: "9",
      customerPhone: "08090839255",
      orderAmount: "350.00",
      vendorName: "Aunty Pat",
      orderType: "unpaid",
    ),
    OrderOverView(
      timeStamp: "null",
      status: "Processed",
      customerName: "Funmi",
      itemCount: "4",
      customerPhone: "08090839255",
      orderAmount: "300.00",
      vendorName: "Iya Sharon",
      orderType: "unpaid",
    ),
    OrderOverView(
      timeStamp: "null",
      status: "Pending",
      customerName: "Mike",
      itemCount: "2",
      customerPhone: "08090839255",
      orderAmount: "250.00",
      vendorName: "Mama Calabar",
      orderType: "paid",
    ),
    OrderOverView(
      timeStamp: "null",
      status: "Completed",
      customerName: "Emma",
      itemCount: "6",
      customerPhone: "08090839255",
      orderAmount: "100.00",
      vendorName: "Mama Calabar",
      orderType: "paid",
    ),
    OrderOverView(
      timeStamp: "null",
      status: "Pending",
      customerName: "Chichi",
      itemCount: "8",
      customerPhone: "08090839255",
      orderAmount: "200.00",
      vendorName: "Mama Calabar",
      orderType: "unpaid",
    ),
    OrderOverView(
      timeStamp: "null",
      status: "Cancelled",
      customerName: "Ola",
      itemCount: "4",
      customerPhone: "08090839255",
      orderAmount: "300.00",
      vendorName: "Mama Calabar",
      orderType: "paid",
    ),
    OrderOverView(
      timeStamp: "null",
      status: "Cancelled",
      customerName: "Ife",
      itemCount: "3",
      customerPhone: "08090839255",
      orderAmount: "500.00",
      vendorName: "Mama Calabar",
      orderType: "unpaid",
    ),
  ];
}
