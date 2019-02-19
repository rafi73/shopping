<template>
    <v-layout row>
        <v-flex xs12 class="m-3 px-3">
            <v-card>
                <v-card-title class="grey lighten-4">
                    <v-icon class="pr-2">
                        {{ $route.meta.icon }}
                    </v-icon>
                    <h3 class="headline mb-0">{{ $route.meta.name }}</h3>
                </v-card-title>

                <v-container grid-list-md>
                    <v-layout wrap>
                        <v-flex xs12 sm6 md6>
                                <GChart :settings="{packages: ['bar']}" :data="chartData3" :options="chartOptions3"
                                :createChart="(el, google) => new google.charts.Bar(el)" @ready="onChartReady" />
                        </v-flex>

                        <v-flex xs12 sm6 md6>
                            <GChart type="BubbleChart" :data="chartData2" :options="chartOptions2" style="height: 500px;"/>
                        </v-flex>
                    </v-layout>

                    <v-layout wrap>
                        <v-flex xs12 sm12 md12>
                            
                        </v-flex>
                    </v-layout>
                </v-container>
                <v-spacer></v-spacer>
            </v-card>
        </v-flex>
    </v-layout>
</template>

<script>
    import { GChart } from 'vue-google-charts'
    export default {
        components: {
            GChart
        },
        data: () => ({
            chartData: [
                ['Year', 'Sales', 'Expenses', 'Profit'],
                ['2014', 1000, 400, 200],
                ['2015', 1170, 460, 250],
                ['2016', 660, 1120, 300],
                ['2017', 1030, 540, 350]
            ],
            chartOptions: {
                chart: {
                    title: 'Company Performance',
                    subtitle: 'Sales, Expenses, and Profit: 2014-2017',
                }
            },
            chartData2: [
                ["ID", "X", "Y", "Temperature"],
                ["", 80, 167, 120],
                ["", 79, 136, 130],
                ["", 78, 184, 50],
                ["", 72, 278, 230],
                ["", 81, 200, 210],
                ["", 72, 170, 100],
                ["", 68, 477, 80]
            ],
            chartOptions2: {
                colorAxis: { colors: ["yellow", "red"] }
            },
            chartsLib: null,
            // Array will be automatically processed with visualization.arrayToDataTable function
            chartData3: [
                ['Year', 'Sales', 'Expenses', 'Profit'],
                ['2014', 1000, 400, 200],
                ['2015', 1170, 460, 250],
                ['2016', 660, 1120, 300],
                ['2017', 1030, 540, 350]
            ]
        }),

        props: {
        },

        created() {
            console.log('Home Component created.')
        },

        mounted() {
            console.log('Home Component mounted.')
        },

        computed: {
            chartOptions3() {
                if (!this.chartsLib) return null
                return this.chartsLib.charts.Bar.convertOptions({
                    chart: {
                        title: 'Company Performance',
                        subtitle: 'Sales, Expenses, and Profit: 2014-2017'
                    },
                    bars: 'horizontal', // Required for Material Bar Charts.
                    hAxis: { format: 'decimal' },
                    height: 400,
                    colors: ['#1b9e77', '#d95f02', '#7570b3']
                })
            }
        },
        methods: {
            onChartReady(chart, google) {
                this.chartsLib = google
            }
        }

    }
</script>