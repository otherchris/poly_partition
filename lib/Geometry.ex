defmodule PolyPartition.Geometry do

  def sq_length(seg) do
    [[x1, y1], [x2, y2]] = seg
    :math.pow((x2 - x1), 2) + :math.pow((y2 - y1), 2)
  end

  def midpoint(seg) do
    [[x1, y1], [x2, y2]] = seg
    [(x1 + x2) / 2, (y1 + y2) / 2]
  end
  defp slope(point1, point2) do
    [x1, y1] = point1
    [x2, y2] = point2
    case x2 - x1 do
      0 -> "vert"
      0.0 -> "vert"
      _ -> (y2 - y1) / (x2 - x1)
    end
  end

  def area(poly) do
    sample_lat = (List.last(hd(poly)) * 2 * :math.pi)/360
    lat_adj = :math.cos(sample_lat)
    factor = :math.pow(((69.0 * lat_adj) + 69.0) / 2.0, 2)
    get_segments(poly)
    |> Enum.map(fn(x) -> det_seg(x) end)
    |> List.foldr(0, fn(x, acc) -> x + acc end)
    |> Kernel./(2.0)
    |> abs
    |> Kernel.*(factor)
  end

  def rotate90(point) do
    [x, y] = point
    [-y, x]
  end

  def rotate90_seg(seg) do
    Enum.map(seg, fn(x) -> rotate90(x) end)
  end

  @doc """
    sign of result indicates which side of the line through <sample>
    with slope <m> the point <given> lies on
  """
  defp point_score(given, sample, m) do
    [h, k] = sample
    [x, y] = given
    y - (m * x) - k + (m * h)
  end

  @doc """
    returns an [ [ [x1, y1], [x2, y2] ], ... ] list representing the
    sides of the polygon
  """
  def get_segments(poly) do
    poly
    |> Stream.with_index
    |> Enum.map(fn(x) ->
      {point, index} = x
      [point, Enum.at(poly, rem((index + 1), length(poly)))]
    end)
  end

  @doc """
    determine intersection of segments orthogonal to axes
  """
  def perp_intersect?(seg1, seg2) do
    #vert is first
    [[x1, y11], [_, y12]] = seg1
    [[x21, y2], [x22, _]] = seg2
    horiz = (x21 - x1) * (x22 - x1)
    vert = (y11 - y2) * (y12 - y2)
    !(horiz >= 0 ||  vert >= 0)
  end

  @doc """
    Do two segments share an endpoint?
  """
  def share_endpoint?(seg1, seg2) do
    [p11, p12] = seg1
    [p21, p22] = seg2
    cond do
      p11 == p21 -> true
      p11 == p22 -> true
      p12 == p21 -> true
      p12 == p22 -> true
      true -> false
    end
  end

  def one_side_intersect?(seg1, seg2) do
    [p11, p12] = seg1
    [p21, p22] = seg2
    m = slope(p11, p12)
    n = slope(p21, p22)
    k1 = case n do
      "vert" -> "vert"
      _ -> point_score(p21, p11, n)
    end
    k2 = case n do
      "vert" -> "vert"
      _ -> point_score(p21, p12, n)
    end
    degen = share_endpoint?(seg1, seg2)
    case {m, n, k1, k2, degen} do
      {_, _, _, _, true} -> false
      {"vert", 0.0, _, _, _} -> perp_intersect?(seg1, seg2)
      {0.0, "vert", _, _, _} -> perp_intersect?(seg2, seg1)
      {"vert", _, _, _, _} -> one_side_intersect?(rotate90_seg(seg1), rotate90_seg(seg2))
      {_, "vert", _, _, _} -> one_side_intersect?(rotate90_seg(seg2), rotate90_seg(seg1))
      {_, _, "vert", _, _} -> one_side_intersect?(rotate90_seg(seg1), rotate90_seg(seg2))
      {_, _, _, "vert", _} -> one_side_intersect?(rotate90_seg(seg1), rotate90_seg(seg2))
      _ -> sgn_to_bool(k1, k2)
    end
  end

  def intersect?(seg1, seg2) do
    one_side_intersect?(seg1, seg2) && one_side_intersect?(seg2, seg1)
  end

  def intersect_side?(poly, seg) do
    sides = get_segments(poly)
    values = Enum.map(sides, fn(x) -> intersect?(seg, x) end)
    List.foldl(values, false, fn(x, acc) -> x || acc end)
  end
end