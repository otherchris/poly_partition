defmodule PolyPartition.Fixtures do
  @moduledoc"""
  Fixture data for tests
  """

  def non_convex do
    [
      [0, 1],
      [0.25, 0.25],
      [1, 0],
      [0.25, -0.25],
      [0, -1],
      [0.1, 0.1],
      [-1, 0],
      [-0.25, 0.25]
    ]
  end

  def non_convex_split do
    [
      [
        [0, 1],
        [0.25, 0.25],
        [1, 0],
        [0.25, -0.25],
        [0, -1],
        [0.1, 0.1]
      ],
      [
        [0.1, 0.1],
        [-1, 0],
        [-0.25, 0.25],
        [0, 1]
      ]
    ]
  end

  def convex do
    [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0]
    ]
  end

  def convex_segs do
    [
     [
        [0, 1],
        [1, 0],
      ],
      [
        [1, 0],
        [0, -1],
      ],
      [
        [0, -1],
        [-1, 0],
      ],
      [
        [-1, 0],
        [0, 1],
      ]
    ]
  end

  def convex_split do
    [
      [
        [0, 1],
        [1, 0],
        [0, -1],
      ],
      [
        [0, -1],
        [-1, 0],
        [0, 1],
      ]
    ]
  end

  def triangle do
    [
     [-1, 0],
      [0, 1],
      [1, 0],
    ]
  end

  def triangle_split_side do
    [
     [-1, 0],
      [0, 1],
      [1, 0],
      [0, 0],
    ]
  end

  def triangle2 do
    [
     [1, 0],
      [0, 1],
      [-1, 0],
    ]
  end

  def triangle_split_side2 do
    [
     [1, 0],
      [0, 1],
      [-1, 0],
      [0.0, 0.0],
    ]
  end

  def degenerate do
    [
      [0, 1],
      [0, 1],
    ]
  end

  def realsimple do
    [
      [
        -85.4791259765625,
        38.19718009396176
      ],
      [
        -85.47294616699219,
        38.14751758025121
      ],
      [
        -85.38436889648438,
        38.21714351862661
      ],
      [
        -85.4351806640625,
        38.21876193471268
      ],
    ]
  end

  def realcomplex do
    [
      [
        -85.60890197753906,
        38.131856078273124
      ],
      [
        -85.58486938476562,
        38.038357297980816
      ],
      [
        -85.41664123535156,
        38.058364198044636
      ],
      [
        -85.37750244140625,
        38.245730236135316
      ],
      [
        -85.48736572265625,
        38.07620357665235
      ],
      [
        -85.51551818847656,
        38.205274034117814
      ],
      [
        -85.54710388183594,
        38.090255780611486
      ],
      [
        -85.5889892578125,
        38.22307753495298
      ],
      [
        -85.69473266601562,
        38.182068998322094
      ],
      [
        -85.61027526855469,
        38.176671418717746
      ],
    ]
  end

  def crazygon do [
    %{
        type: "MultiPolygon",
        coordinates: [
          [[
            [
              -85.83017349243163,
              38.2283368266312
            ],
            [
              -85.82948684692381,
              38.18017989094241
            ],
            [
              -85.79893112182616,
              38.183013533643944
            ],
            [
              -85.82090377807617,
              38.18895033240988
            ],
            [
              -85.78502655029297,
              38.20406000045743
            ],
            [
              -85.82502365112305,
              38.19677537333436
            ],
            [
              -85.76288223266602,
              38.2255049475924
            ],
            [
              -85.77352523803711,
              38.17721119467082
            ],
            [
              -85.74966430664062,
              38.180314828808186
            ],
            [
              -85.76356887817383,
              38.187736026569354
            ],
            [
              -85.74691772460938,
              38.23278669950994
            ],
            [
              -85.79086303710938,
              38.25260555271059
            ],
            [
              -85.770263671875,
              38.23143828193398
            ],
            [
              -85.80802917480469,
              38.21296244379419
            ],
            [
              -85.80390930175781,
              38.252875159715835
            ],
            [
              -85.82107543945312,
              38.244651696093634
            ],
            [
              -85.81850051879883,
              38.207297378559915
            ],
            [
              -85.83017349243163,
              38.2283368266312
            ]
          ]]
        ]
      }
  ]
  end

  def realinput do [
    %{
      type: "MultiPolygon",
      coordinates: [
        [[
          [
            -88.7750244140625,
            37.99183365313853
          ],
          [
            -88.0828857421875,
            37.339591851359174
          ],
          [
            -86.7205810546875,
            37.48793540168987
          ],
          [
            -86.08337402343749,
            38.14319750166766
          ],
          [
            -87.03369140625,
            39.16414104768742
          ],
          [
            -88.5992431640625,
            39.193948213963665
          ],
          [
            -88.7750244140625,
            37.99183365313853
          ]
        ]],
        [[
          [
            -88.0828857421875,
            37.339591851359174
          ],
          [
            -86.7205810546875,
            37.48793540168987
          ],
          [
            -86.08337402343749,
            38.14319750166766
          ],
          [
            -88.0828857421875,
            37.339591851359174
          ],
        ]]
      ]
    },
    %{
      type: "MultiPolygon",
      coordinates: [
        [[
          [
            -88.0828857421875,
            37.339591851359174
          ],
          [
            -86.7205810546875,
            37.48793540168987
          ],
          [
            -86.08337402343749,
            38.14319750166766
          ],
          [
            -88.0828857421875,
            37.339591851359174
          ],
        ]]
      ]
    }
  ]
  end

  def small_adhoc() do
  [
    %{
        type: "MultiPolygon",
        coordinates: [
          [
            [
              [
                -85.7621955871582,
                38.235753130172334
              ],
              [
                -85.78948974609375,
                38.25570597288232
              ],
              [
                -85.79584121704102,
                38.233595738054944
              ],
            ]
          ]
        ]
      }
  ]
  end
  def adhoc() do

[
  %{
    type: "MultiPolygon",
    coordinates: [
      [[
        [ -85.82897186279297, 38.232651858877404 ],
        [ -85.84270477294922, 38.21539019391173 ],
        [ -85.82244873046875, 38.19974327236468 ],
        [ -85.80305099487305, 38.21970599413905 ],
        [ -85.82897186279297, 38.232651858877404 ]
      ]]
    ]
    },
    %{
      type: "MultiPolygon",
      coordinates: [
          [[
            [
              -85.77850341796875,
              38.225774655107976
            ],
            [
              -85.78193664550781,
              38.21835733406591
            ],
            [
              -85.77695846557617,
              38.22065004131618
            ],
            [
              -85.77850341796875,
              38.225774655107976
            ]
          ]]
        ]
    },
    %{
      type: "MultiPolygon",
      coordinates: [
          [[
            [
              -85.79584121704102,
              38.233595738054944
            ],
            [
              -85.7621955871582,
              38.235753130172334
            ],
            [
              -85.78948974609375,
              38.25570597288232
            ],
            [
              -85.79584121704102,
              38.233595738054944
            ]
          ]]
        ]
    },
    %{
      type: "MultiPolygon",
      coordinates: [
          [[
            [
              -85.79172134399414,
              38.20338552856447
            ],
            [
              -85.78828811645508,
              38.19610083395667
            ],
            [
              -85.78794479370117,
              38.17883049854014
            ],
            [
              -85.76013565063477,
              38.1966404659587
            ],
            [
              -85.78313827514647,
              38.21066949431694
            ],
            [
              -85.79172134399414,
              38.20338552856447
            ]
          ]]
        ]
      }
  ]
  end
end
