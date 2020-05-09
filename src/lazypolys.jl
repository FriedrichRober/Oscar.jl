## LazyPolyRing

struct LazyPolyRing{T<:RingElement,R<:Ring} <: MPolyRing{T}
   base_ring::R

   LazyPolyRing(r::Ring) = new{elem_type(r),typeof(r)}(r)
end

base_ring(F::LazyPolyRing) = F.base_ring


## RecPoly

abstract type RecPoly{T<:RingElement} end


### Const

struct Const{T} <: RecPoly{T}
   c::T
end

Base.show(io::IO, c::Const) = print(io, c.c)


### Gen

struct Gen{T} <: RecPoly{T}
   g::Symbol
end

Base.show(io::IO, g::Gen) = print(io, g.g)


### PlusPoly

struct PlusPoly{T} <: RecPoly{T}
   xs::Vector{RecPoly{T}}
end

PlusPoly(xs::RecPoly{T}...) where {T} = PlusPoly(collect(RecPoly{T}, xs))

function Base.show(io::IO, p::PlusPoly)
   print(io, '(')
   join(io, p.xs, " + ")
   print(io, ')')
end


### MinusPoly

struct MinusPoly{T} <: RecPoly{T}
   p::RecPoly{T}
   q::RecPoly{T}
end

Base.show(io::IO, p::MinusPoly) = print(io, '(', p.p, " - ", p.q, ')')
