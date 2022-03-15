import 'package:airplane_app/models/transaction_model.dart';
import 'package:airplane_app/ui/widgets/booking_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './../../shared/theme.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(transaction.destination.imageUrl),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                          fontSize: 14, fontWeight: light),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/icon_star.png'),
                      ),
                    ),
                  ),
                  Text(
                    transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(fontWeight: medium),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Booking Details',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          BookingDetailItem(
            title: 'Traveler',
            value: '${transaction.travelerCount} Person',
          ),
          BookingDetailItem(
            title: 'Seat',
            value: transaction.selectedSeats.join(', '),
          ),
          BookingDetailItem(
            title: 'Insurance',
            value: transaction.insurance ? 'YES' : 'NO',
            color: transaction.insurance ? kGreenColor : kRedColor,
          ),
          BookingDetailItem(
            title: 'Refundable',
            value: transaction.refundable ? 'YES' : 'NO',
            color: transaction.refundable ? kGreenColor : kRedColor,
          ),
          BookingDetailItem(
            title: 'VAT',
            value: '${(transaction.vat * 100).toStringAsFixed(0)}%',
          ),
          BookingDetailItem(
            title: 'Price',
            value: NumberFormat.currency(
                    locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(transaction.destination.price),
          ),
          BookingDetailItem(
            title: 'Grand Total',
            value: NumberFormat.currency(
                    locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                .format(transaction.grandTotal),
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
