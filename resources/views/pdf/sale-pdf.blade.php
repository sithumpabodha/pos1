<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "//www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>{{ __('messages.sale_pdf') }}</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        * {
            font-family: DejaVu Sans, Arial, "Helvetica", Arial, "Liberation Sans", sans-serif;
            font-size: 10px; /* Smaller font for thermal printing */
        }

        .fw-bold {
            font-weight: bold;
        }

        .fw-light {
            font-weight: normal;
        }

        table {
            width: 100%;
            margin-bottom: 5px;
        }

        th, td {
            padding: 2px;
            text-align: left;
            font-size: 9px; /* Even smaller for the table rows */
        }

        th {
            font-weight: bold;
        }

        .section-title {
            font-size: 12px;
            font-weight: bold;
        }

        .text-right {
            text-align: right;
        }

        .line {
            border-bottom: 1px solid #000;
            margin: 5px 0;
        }

        /* Remove margin and padding to fit better on thermal paper */
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }

        .header, .footer {
            text-align: center;
        }

        .content {
            margin-left: 0;
            margin-right: 0;
        }
    </style>
</head>
<body>

<table>
    <tr>
        <td>
            <img src="{{$companyLogo}}" alt="Company Logo" width="60px">
        </td>
        <td align="center" style="vertical-align: bottom">
            <h2>{{ $sale->reference_code }}</h2>
        </td>
        <td width="30%" style="line-height: 5px;">
            <p class="fw-bold">{{ __('messages.pdf.date') }}: <span class="fw-light">{{ \Carbon\Carbon::parse($sale->created_at)->format('Y-m-d') }}</span></p>
            <p class="fw-bold">{{ __('messages.pdf.number') }}: <span class="fw-light">{{ $sale->reference_code }}</span></p>
            <p class="fw-bold">{{ __('messages.pdf.payment_status') }}: <span class="fw-light">{{ $sale->payment_status == \App\Models\Sale::PAID ? 'Paid' : 'Unpaid' }}</span></p>
        </td>
    </tr>
</table>

<div class="line"></div>

<table>
    <thead>
    <tr>
        <th>{{ __('messages.pdf.product') }}</th>
        <th>{{ __('messages.pdf.unit_price') }}</th>
        <th>{{ __('messages.pdf.quantity') }}</th>
        <th>{{ __('messages.heading_discount') }}</th>
        <th>{{ __('messages.pdf.tax') }}</th>
        <th>{{ __('messages.heading_total') }}</th>
    </tr>
    </thead>
    <tbody>
    @foreach($sale->saleItems as $saleItem)
        <tr>
            <td>{{ $saleItem->product->name }}</td>
            <td>{{ currencyAlignment(number_format((float)$saleItem->net_unit_price, 2)) }}</td>
            <td>{{ $saleItem->quantity }}</td>
            <td>{{ currencyAlignment(number_format((float)$saleItem->discount_amount, 2)) }}</td>
            <td>{{ currencyAlignment(number_format((float)$saleItem->tax_amount, 2)) }}</td>
            <td>{{ currencyAlignment(number_format((float)$saleItem->sub_total, 2)) }}</td>
        </tr>
    @endforeach
    </tbody>
</table>

<div class="line"></div>

<table>

    <tr>
        <td>{{ __('messages.pdf.discount') }}</td>
        <td class="text-right">{{ currencyAlignment(number_format((float)$sale->discount, 2)) }}</td>
    </tr>
    <tr>
        <td>{{ __('messages.pdf.total') }}</td>
        <td class="text-right">{{currencyAlignment(number_format((float)$sale->grand_total, 2))}}</td>
    </tr>

    <tr>
        <td>{{ __('messages.pdf.paid_amount') }}</td>
        <td class="text-right">{{currencyAlignment(number_format((float)$sale->payments->sum('amount'), 2))}}</td>
    </tr>
</table>

</body>
</html>
